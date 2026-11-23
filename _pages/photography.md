---
layout: page
permalink: /photography/
title: photography
description: Birds and other wildlife, mostly from fieldwork and personal trips.
nav: false
nav_order: 6
---

<!-- Photos and captions live in _data/photos.yml; image files in assets/img/photos/.
     A photo only appears once its file exists AND its caption and alt text no longer
     contain "TODO", so the list can be filled in gradually. -->

{% assign sections = "birds:Birds,wildlife:Other wildlife,plants:Plants,landscapes:Landscapes" | split: "," %}
{% for s in sections %}
{% assign key = s | split: ":" | first %}
{% assign label = s | split: ":" | last %}
{% assign shown = 0 %}
{% capture grid %}
{% for p in site.data.photos[key] %}
{% assign path = "/assets/img/photos/" | append: p.file %}
{% assign found = site.static_files | where: "path", path | first %}
{% assign rel = path | remove_first: "/" %}
{% assign captioned = true %}
{% if p.caption == blank or p.caption contains "TODO" or p.alt == blank or p.alt contains "TODO" %}{% assign captioned = false %}{% endif %}
{% if found and captioned %}
{% assign shown = shown | plus: 1 %}

<div class="col-sm-6 col-md-4 mt-3">
  {% include figure.liquid path=rel caption=p.caption alt=p.alt class="img-fluid rounded z-depth-1" zoomable=true %}
</div>
{% endif %}
{% endfor %}
{% endcapture %}
{% if shown > 0 %}

## {{ label }}

<div class="row">
{{ grid }}
</div>
{% endif %}
{% endfor %}
