require 'jekyll'
require 'json'
require 'bibtex'
require 'csl'
require 'csl/styles'
require 'citeproc'
require 'date'

CSL::Style.root = File.expand_path('_csl', Dir.pwd)

module Jekyll
  class CiteTag < Liquid::Tag
    @@processors = {}

    def initialize(tag_name, markup, tokens)
      super
      @expr = markup.strip
    end

    def render(context)
      format = resolve(@expr, context)
      data = context['page']
      case format
      when 'BibTeX'
        d = csl(data, format, 'tex')
        bib(d)
      when 'RIS'
        d = csl(data, format)
        ris(d)
      when 'CSL-JSON'
        d = csl(data, format)
        JSON.pretty_generate(d)
      # when "Harvard"
      #   return harvard(d)
      else
        d = csl(data, format, 'html')
        citeproc(d, format)
      end
    end

    private

    def resolve(expr, context)
      parts = expr.split('.')
      obj = context[parts.shift]
      parts.each do |p|
        return nil unless obj.is_a?(Hash) && obj.key?(p)

        obj = obj[p]
      end
      obj
    end

    def csl(d, format, coding = 'plain')
      type = case d['document']
             when 'article'
               d.key?('journal') ? 'article-journal' : 'article'
             when 'poster' then 'speech'
             when 'presentation' then 'speech'
             when 'lecture' then 'speech'
             when 'thesis' then 'thesis'
             else 'document'
             end
      genre = case d['document']
              when 'poster' then 'Poster'
              when 'presentation' then 'Slides'
              when 'lecture' then 'Lecture'
              when 'thesis' then 'Thesis'
              end
      genre = case d['subtype']
              when 'bachelors-thesis'
                "Bachelor's thesis"
              when 'masters-thesis'
                "Master's thesis"
              when 'phd-thesis'
                'Doctoral dissertation'
              else
                genre
              end
      issued = { "date-parts": [[d['year']]] } if d['year']
      if d['date']
        issued = { "date-parts": [[d['date'].year, d['date'].month,
                                   d['date'].day]] }
      end
      issued = nil if d.key?('status') and \
                      %w[AGU APA Chicago Nature].include?(format)
      status = case format
               when 'Chicago'
                 d['status'] == 'in press' ? 'forthcoming' : d['status']
               else
                 d['status']
               end
      url = d.key?('doi') ? 'https://doi.org/' + d['doi'] : d['_url']
      {
        id: d['code'],
        type: type,
        genre: genre,
        title: case coding
               when 'html'
                 d.key?('title_html') ? d['title_html'] : d['title']
               when 'tex'
                 d.key?('title_tex') ? d['title_tex'] : d['title']
               else
                 d['title']
               end,
        "container-title": d['journal'],
        "collection-title": d['course'],
        volume: d['volume'],
        issue: d['number'],
        page: d['pages'].is_a?(Array) ? d['pages'].join('-') : d['pages'],
        "number-of-pages": d['no_pages'],
        DOI: d['doi'],
        URL: url,
        status: status,
        note: d['note'],
        issued: issued,
        author: d['authors'].map do |x|
          { family: x['last'], given: x['first'] }
        end,
        publisher: type == 'thesis' ? d['school'] : nil,
        archive: d.key?('journal') && d.key?('volume') ? nil : d['archive'],
        "event-title": d['event'],
        "event-place": d['event_place'],
        "event-date": if d.key?('event_date')
                        { "date-parts": Array(d['event_date']).map do |x|
                          [x.year, x.month, x.day]
                        end }
                      end
      }.compact
    end

    def bib_escape(s)
      map = {
        'á' => "\\'{a}",  'Á' => "\\'{A}",
        'à' => '\\`{a}',  'À' => '\\`{A}',
        'â' => '\\^{a}',  'Â' => '\\^{A}',
        'ä' => '\"{a}', 'Ä' => '\"{A}',
        'ã' => '\\~{a}',  'Ã' => '\\~{A}',
        'å' => '\\r{a}',  'Å' => '\\r{A}',
        'ā' => '\\={a}',  'Ā' => '\\={A}',
        'ă' => '\\u{a}',  'Ă' => '\\u{A}',
        'ą' => '\\k{a}',  'Ą' => '\\k{A}',
        'é' => "\\'{e}",  'É' => "\\'{E}",
        'è' => '\\`{e}',  'È' => '\\`{E}',
        'ê' => '\\^{e}',  'Ê' => '\\^{E}',
        'ë' => '\"{e}', 'Ë' => '\"{E}',
        'ē' => '\\={e}',  'Ē' => '\\={E}',
        'ė' => '\\.{e}',  'Ė' => '\\.{E}',
        'ę' => '\\k{e}',  'Ę' => '\\k{E}',
        'í' => "\\'{i}",  'Í' => "\\'{I}",
        'ì' => '\\`{i}',  'Ì' => '\\`{I}',
        'î' => '\\^{i}',  'Î' => '\\^{I}',
        'ï' => '\"{i}', 'Ï' => '\"{I}',
        'ī' => '\\={i}',  'Ī' => '\\={I}',
        'į' => '\\k{i}',  'Į' => '\\k{I}',
        'ó' => "\\'{o}",  'Ó' => "\\'{O}",
        'ò' => '\\`{o}',  'Ò' => '\\`{O}',
        'ô' => '\\^{o}',  'Ô' => '\\^{O}',
        'ö' => '\"{o}', 'Ö' => '\"{O}',
        'õ' => '\\~{o}',  'Õ' => '\\~{O}',
        'ō' => '\\={o}',  'Ō' => '\\={O}',
        'ø' => '{\\o}',   'Ø' => '{\\O}',
        'ő' => '\\H{o}',  'Ő' => '\\H{O}',
        'ú' => "\\'{u}",  'Ú' => "\\'{U}",
        'ù' => '\\`{u}',  'Ù' => '\\`{U}',
        'û' => '\\^{u}',  'Û' => '\\^{U}',
        'ü' => '\"{u}', 'Ü' => '\"{U}',
        'ũ' => '\\~{u}',  'Ũ' => '\\~{U}',
        'ū' => '\\={u}',  'Ū' => '\\={U}',
        'ű' => '\\H{u}',  'Ű' => '\\H{U}',
        'ç' => '\\c{c}',  'Ç' => '\\c{C}',
        'č' => '\\v{c}',  'Č' => '\\v{C}',
        'ć' => "\\'{c}",  'Ć' => "\\'{C}",
        'ñ' => '\\~{n}',  'Ñ' => '\\~{N}',
        'ń' => "\\'{n}",  'Ń' => "\\'{N}",
        'ň' => '\\v{n}',  'Ň' => '\\v{N}',
        'ś' => "\\'{s}",  'Ś' => "\\'{S}",
        'š' => '\\v{s}',  'Š' => '\\v{S}',
        'ß' => '{\\ss}',
        'ž' => '\\v{z}',  'Ž' => '\\v{Z}',
        'ź' => "\\'{z}",  'Ź' => "\\'{Z}",
        'ż' => '\\.{z}',  'Ż' => '\\.{Z}',
        'ł' => '\\l{}',   'Ł' => '\\L{}',
        'æ' => '{\\ae}',  'Æ' => '{\\AE}',
        'œ' => '{\\oe}',  'Œ' => '{\\OE}'
      }
      s.chars.map { |c| map[c] || c }.join
    end

    def bib_event_date(event_date)
      return nil if event_date.nil?

      parts = event_date[:'date-parts']
      return nil if parts.nil? || parts.empty?

      if parts.length == 1
        d = parts[0]
        "#{d[2]} #{Date::MONTHNAMES[d[1]]} #{d[0]}"
      else
        start = parts[0]
        end_ = parts[1]
        if start[0] == end_[0] && start[1] == end_[1]
          "#{start[2]}--#{end_[2]} #{Date::MONTHNAMES[start[1]]} #{start[0]}"
        elsif start[0] == end_[0]
          "#{start[2]} #{Date::MONTHNAMES[start[1]]} -- " \
          "#{end_[2]} #{Date::MONTHNAMES[end_[1]]} #{start[0]}"
        else
          "#{start[2]} #{Date::MONTHNAMES[start[1]]} #{start[0]} -- " \
          "#{end_[2]} #{Date::MONTHNAMES[end_[1]]} #{end_[0]}"
        end
      end
    end

    def bib(d)
      type = case d[:type]
             when 'article-journal' then 'article'
             when 'article' then 'unpublished'
             when 'book' then 'book'
             else 'misc'
             end
      type = case d[:genre]
             when 'Doctoral dissertation' then 'phdthesis'
             when "Master's thesis" then 'mastersthesis'
             when "Bachelor's thesis" then 'mastersthesis'
             else type
             end
      e = BibTeX::Entry.new
      e.type = type
      e.key = d[:id] if d.key?(:id)
      e[:title] = d[:title] if d.key?(:title)
      e[:year] = d[:issued]&.dig(:"date-parts", 0, 0) if d.key?(:issued)
      e[:journal] = d[:"container-title"] if d.key?(:"container-title")
      e[:volume] = d[:volume] if d.key?(:volume)
      e[:number] = d[:issue] if d.key?(:issue)
      e[:pages] = d[:page] if d.key?(:page)
      e[:school] = d[:publisher] if (d[:type] == 'thesis') && d.key?(:publisher)
      e[:type] = d[:genre] \
        if ["Bachelor's thesis", "Master's thesis"].include?(d[:genre])
      e[:doi] = d[:DOI] if d.key?(:DOI)
      e[:url] = "https://doi.org/#{d[:DOI]}" if d.key?(:DOI)
      if d[:type] == 'speech'
        event = []
        event << d[:genre].downcase
        event << "in #{d[:"collection-title"]}" if d.key?(:"collection-title")
        if d.key?(:"event-title") || d.key?(:"event-place")
          event << 'presented at'
          event << [
            d[:"event-title"],
            d[:"event-place"],
            bib_event_date(d[:"event-date"])
          ].compact.join(', ')
        end
        e[:howpublished] = event.join(' ')
      end
      note = []
      note << d[:status] if d.key?(:status)
      note << d[:note] if d.key?(:note)
      e[:note] = note.compact.join('; ')
      if d.key?(:author)
        e[:author] = d[:author].map do |x|
          "#{x[:family]}, #{x[:given]}"
        end.join(' and ')
      end
      bib_escape(e.to_s.strip)
    end

    def ris(d)
      r = []
      r << "ID  - #{d[:id]}" if d.key?(:id)
      type = case d[:type]
             when 'article-journal' then 'JOUR'
             when 'article' then 'UNPB'
             when 'speech' then case d[:genre]
                                when 'Slides' then 'SLIDE'
                                else 'GEN'
                                end
             when 'thesis' then 'THES'
             else 'GEN'
             end
      type = 'INPR' \
        if d[:type] == 'article-journal' and d[:status] == 'in press'
      r << "TY  - #{type}"
      if d.key?(:author)
        d[:author].each do |x|
          r << "AU  - #{x[:family]}, #{x[:given]}"
        end
      end
      date = d.key?(:issued) ? d[:issued][:"date-parts"][0] : nil
      r << "PY  - #{date[0]}" unless date.nil?
      if date.size == 3
        r << "DA  - #{date[0]}/#{format('%02d',
                                        date[1])}/#{format('%02d',
                                                           date[2])}"
      end
      r << "TI  - #{d[:title]}" if d.key?(:title)
      r << "M3  - #{d[:genre].capitalize}" if d.key?(:genre)
      r << "PB  - #{d[:publisher]}" if d.key?(:publisher)
      r << "T2  - #{d[:"event-title"]}" if d.key?(:"event-title")
      r << "T3  - #{d[:"collection-title"]}" if d.key?(:"collection-title")
      r << "CY  - #{d[:"event-place"]}" if d.key?(:"event-place")
      r << "JO  - #{d[:"container-title"]}" if d.key?(:"container-title")
      r << "VL  - #{d[:volume]}" if d.key?(:volume)
      r << "IS  - #{d[:issue]}" if d.key?(:issue)
      if d.key?(:page)
        pages = d[:page].split('-')
        if pages.size == 1
          r << "SP  - #{d[:page]}" if d.key?(:page)
        else
          r << "SP  - #{pages[0]}"
          r << "EP  - #{pages[1]}"
        end
      end
      r << "DB  - #{d[:archive]}" if d.key?(:archive)
      r << "DO  - #{d[:DOI]}" if d.key?(:DOI)
      r << "UR  - #{d[:URL]}" if d.key?(:URL)
      r << "N1  - #{d[:status].capitalize}" if d.key?(:status)
      r << 'ER  -'
      r.join("\n")
    end

    def get_genre(genre, style)
      case style
      when 'AMetSoc'
        case genre
        when 'Doctoral dissertation' then 'Ph.D. dissertation'
        when "Master's thesis" then 'M.S. thesis'
        else genre
        end
      when 'Chicago'
        case genre
        when 'Doctoral dissertation' then 'PhD diss.'
        else genre
        end
      when 'Copernicus'
        case genre
        when 'Doctoral dissertation' then 'Ph.D. thesis'
        else genre
        end
      when 'APA'
        case genre
        when 'Poster' then 'Poster presentation'
        when 'Slides' then 'Presentation slides'
        when 'Lecture' then 'Lecture notes'
        else genre
        end
      when 'Harvard'
        case genre
        when 'Poster' then 'Poster presentation'
        when 'Slides' then 'Presentation slides'
        when 'Lecture' then 'Presentation slides'
        else genre
        end
      else
        genre
      end
    end

    def citeproc(item, style)
      item[:genre] = get_genre(item[:genre], style)
      @@processors[style] ||= CiteProc::Processor.new(style: style,
                                                      format: 'html')
      cp = @@processors[style]
      cp.import([item])
      out = cp.render(:bibliography, id: item[:id]).first
      out.gsub(URI::DEFAULT_PARSER.make_regexp(%w[http
                                                  https])) do |url|
        "<a href=\"#{url}\">#{url}</a>"
      end
    end

    def harvard(d)
      return '' unless d.key?(:author)

      authors = d[:author].map do |a|
        family = a[:family].to_s.strip
        given = a[:given].to_s.strip
        initials = given.split(/\s+/).map { |x| x[0] + '.' }.join('')
        "#{family}, #{initials}"
      end
      if authors.length == 1
        authors[0]
      elsif authors.length == 2
        "#{authors[0]} and #{authors[1]}"
      else
        "#{authors[0...-1].join(', ')}, and #{authors[-1]}"
      end
    end
  end
end

Liquid::Template.register_tag('cite', Jekyll::CiteTag)
