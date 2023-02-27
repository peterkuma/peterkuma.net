---
title: Science
layout: default
---

<a href="/rss/" class="rss-feed">RSS feed</a>

## Science

{% assign docs = site.article | concat: site.presentation | concat: site.poster | concat: site.thesis %}

{% for item in site.data.science %}
	{%- capture title -%}
		{%- if item.title -%}
			{{- item.title -}}
		{%- else -%}
			{%- for x in docs -%}
				{%- capture y -%}_{{ item.type }}/{{ item.name }}/index.md{%- endcapture -%}
				{%- if x.path == y -%}
					{%- if x.title_html -%}
						{{- x.title_html -}}
					{%- else -%}
						{{- x.title -}}
					{%- endif -%}
				{%- endif -%}
			{%- endfor -%}
		{%- endif -%}
	{%- endcapture -%}
	{%- capture oa -%}
		{%- if item.oa -%}
			yes
		{%- else -%}
			{%- for x in docs -%}
				{%- capture y -%}_{{ item.type }}/{{ item.name }}/index.md{%- endcapture -%}
				{%- if x.path == y -%}
					{%- if x.license == 'CC BY 4.0' or x.license == 'CC BY-NC 4.0' %}yes{%- endif -%}
				{%- endif -%}
			{%- endfor -%}
		{%- endif -%}
	{%- endcapture -%}
	{%- capture date -%}
		{%- if item.date -%}
			{{ item.date | date: "%Y" }}
		{%- else -%}
			{%- for x in docs -%}
				{%- capture y -%}_{{ item.type }}/{{ item.name }}/index.md{%- endcapture -%}
				{%- if x.path == y -%}{{ x.date | date: "%Y" }}{%- endif -%}
			{%- endfor -%}
		{%- endif -%}
	{%- endcapture -%}
	{%- capture authordate -%}
		{%- if item.author -%}{{ item.author }} ({{ date }}),{%- endif -%}
	{%- endcapture -%}
	{%- capture href -%}
		{%- if item.url -%}
			{{ item.url }}
		{%- elsif item.name -%}
			{%- case item.type -%}
				{%- when "article" -%}papers
				{%- when "thesis" -%}theses
				{%- else -%}{{ item.type }}s
			{%- endcase -%}
			/{{ item.name }}/
		{%- endif -%}
	{%- endcapture -%}
	{%- capture oa_img -%}
		{%- if oa == 'yes' -%}
			<img src="/img/open-access.svg" alt="Open access" title="Open access" style="height: 1em; vertical-align: middle" />
		{%- endif -%}
	{%- endcapture -%}
	{%- capture place -%}
		{%- if item.place -%}({{ item.place }}){%- endif -%}
	{%- endcapture -%}
	{%- capture note -%}
		{%- if item.note -%}; {{ item.note }}{%- endif -%}
	{%- endcapture -%}
	{%- capture titlelink -%}
		{%- if href == "" -%}
			{{- title -}}
		{%- else -%}
			[{{title}}]({{ href }})
		{%- endif -%}
	{%- endcapture -%}
	*{{ item.type | capitalize }}* \| {{ authordate }} {{ titlelink }} {{ oa_img }} {{ place }}{{ note }}

{% endfor %}

### Open source software

[ALCF](https://alcf.peterkuma.net) – Automatic Lidar and Ceilometer Processing Framework

[ccbrowse](https://ccplot.org/ccbrowse/) – Web application for browsing data from active Earth observation satellites

[ccplot](https://ccplot.org) – Command-line application for visualizing data from CloudSat and CALIPSO satellites

[cl2nc](https://github.com/peterkuma/cl2nc) – Convert Vaisala CL51 and CL31 ceilometer dat files to NetCDF

[ds-format](https://ds-format.peterkuma.net) – Python interface for reading and writing NetCDF and a custom dataset format

[mpl2nc](https://github.com/peterkuma/mpl2nc) – Convert Sigma Space Micro Pulse Lidar (MPL) data files to NetCDF

[mrr2c](https://github.com/peterkuma/mrr2c) – Convert Metek MRR-2 micro rain radar data files to HDF

[rstool](https://github.com/peterkuma/rstool) – Command-line program for converting native radiosonde data to NetCDF and calculation of derived quantities, supporting InterMet Systems (iMet) and Windsond radiosondes
