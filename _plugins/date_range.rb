require 'date'

module Jekyll
  module DateRangeFilter
    def date_range(dates)
      dates = Array(dates)
      if dates.length == 1
        dates[0].strftime('%-d %B %Y')
      else
        start, end_ = dates
        if start.year == end_.year && start.month == end_.month
          "#{start.day}–#{end_.day} #{start.strftime('%B %Y')}"
        elsif start.year == end_.year
          "#{start.strftime('%-d %B')} – #{end_.strftime('%-d %B %Y')}"
        else
          "#{start.strftime('%-d %B %Y')} – #{end_.strftime('%-d %B %Y')}"
        end
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::DateRangeFilter)
