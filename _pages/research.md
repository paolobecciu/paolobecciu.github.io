---
layout: page
title: research
permalink: /research/
nav: true
nav_order: 2
horizontal: true
map: true # loads Leaflet for the map of places below the cards
---

<!-- Cards come from the _projects/ folder, ordered by `importance` (1 = first). -->
<div class="projects">
  {% assign sorted_projects = site.projects | sort: "importance" %}
  {% if page.horizontal %}
    <div class="container">
      <div class="row row-cols-1 row-cols-md-2">
        {% for project in sorted_projects %}
          {% include projects_horizontal.liquid %}
        {% endfor %}
      </div>
    </div>
  {% else %}
    <div class="row row-cols-1 row-cols-md-3">
      {% for project in sorted_projects %}
        {% include projects.liquid %}
      {% endfor %}
    </div>
  {% endif %}
</div>


## Where I have worked

<!-- Map points live in the list below. Coordinates are rounded to 0.1° (about 10 km) and
     never mark nests or colonies. The land outline (assets/data/land-110m.json, Natural Earth,
     public domain) carries no place names; never name a country for the Haifa point. -->
<style>
  #places-map { background: color-mix(in srgb, var(--global-theme-color) 9%, var(--global-bg-color)); }
  #places-map .land { fill: color-mix(in srgb, var(--global-text-color) 16%, var(--global-bg-color)); fill-opacity: 1; stroke: none; }
  #places-map .place { fill: var(--global-theme-color); stroke: var(--global-bg-color); }
  #places-map .leaflet-popup-content-wrapper, #places-map .leaflet-popup-tip, #places-map .leaflet-tooltip,
  #places-map .leaflet-bar a, #places-map .leaflet-control-attribution {
    background: var(--global-card-bg-color); color: var(--global-text-color); border-color: var(--global-divider-color);
  }
  #places-map .leaflet-tooltip-top:before { border-top-color: var(--global-card-bg-color); }
  #places-map .leaflet-tooltip-bottom:before { border-bottom-color: var(--global-card-bg-color); }
  #places-map .leaflet-tooltip-left:before { border-left-color: var(--global-card-bg-color); }
  #places-map .leaflet-tooltip-right:before { border-right-color: var(--global-card-bg-color); }
  #places-map a, #places-map .leaflet-control-attribution a { color: var(--global-theme-color); }
  #places-map .leaflet-popup-close-button { color: var(--global-text-color-light); }
</style>
<div id="places-map" class="map rounded z-depth-1" role="region" aria-label="Map of places where I have done fieldwork and research"></div>
<noscript><p>The map needs JavaScript. The places are listed on each research page.</p></noscript>

<script>
  window.addEventListener("load", function () {
    if (!window.L) return;
    var seabirds = { url: "/research/seabird-conservation/", title: "Seabird monitoring and conservation" };
    var flight = { url: "/research/flight-and-migration/", title: "Flight and migration" };
    var owls = { url: "/research/barn-owls/", title: "Barn owls at night, unveiled" };
    var dispersal = { url: "/research/natal-dispersal/", title: "Natal dispersal across birds" };
    var places = [
      { name: "Linosa, Italy", lat: 35.9, lon: 12.9, text: "Scopoli's shearwater monitoring, 2010–2020", page: seabirds },
      { name: "Rome, Italy", lat: 41.9, lon: 12.5, text: "Studies at Sapienza University and collaboration with Ornis italica", page: seabirds },
      { name: "Strait of Messina, Italy", lat: 38.2, lon: 15.6, text: "Radar studies of migrating birds", page: flight },
      { name: "Haifa", lat: 32.8, lon: 35.0, text: "", page: flight },
      { name: "Western Switzerland", lat: 46.7, lon: 6.8, text: "Barn owl tracking, 2020–2025", page: owls },
      { name: "Sempach, Switzerland", lat: 47.1, lon: 8.2, text: "Swiss Ornithological Institute", page: dispersal },
      { name: "Konstanz, Germany", lat: 47.7, lon: 9.2, text: "Max Planck Institute of Animal Behavior, 2019–2020", page: flight },
      { name: "Bermuda", lat: 32.3, lon: -64.8, text: "Bermuda petrel project, 2023–2024", page: seabirds },
      { name: "Floreana, Galápagos", lat: -1.3, lon: -90.4, text: "Galápagos petrel fieldwork, 2024", page: seabirds },
      { name: "San Cristóbal, Galápagos", lat: -0.8, lon: -89.4, text: "Seabird fieldwork", page: seabirds },
      { name: "Isla Lobos de Tierra, Peru", lat: -6.4, lon: -80.9, text: "Fieldwork for Zavalaga et al. 2011, PLoS ONE", page: seabirds },
    ];

    var map = L.map("places-map", { scrollWheelZoom: false, minZoom: 1, maxZoom: 6, zoomSnap: 0.25 });
    map.attributionControl.addAttribution('Land: <a href="https://www.naturalearthdata.com/">Natural Earth</a>');

    var markers = places.map(function (p) {
      var popup = "<strong>" + p.name + "</strong>" + (p.text ? "<br>" + p.text : "") + '<br><a href="' + p.page.url + '">' + p.page.title + "</a>";
      return L.circleMarker([p.lat, p.lon], { radius: 7, weight: 2, fillOpacity: 0.95, className: "place" })
        .bindTooltip(p.name)
        .bindPopup(popup);
    });
    var group = L.featureGroup(markers);
    map.fitBounds(group.getBounds(), { padding: [25, 25] });

    fetch("/assets/data/land-110m.json")
      .then(function (r) { return r.json(); })
      .then(function (land) {
        L.geoJSON(land, { interactive: false, style: { className: "land" } }).addTo(map);
      })
      .catch(function () {})
      .finally(function () { group.addTo(map); });
  });
</script>
