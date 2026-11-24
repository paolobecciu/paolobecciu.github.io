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
     never mark nests or colonies. The basemap has no place labels; never name a country
     for the Haifa point. -->
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

    var root = document.documentElement;
    var accent = function () {
      return getComputedStyle(root).getPropertyValue("--global-theme-color").trim() || "#0b7a75";
    };
    var tileUrl = function () {
      var dark = root.getAttribute("data-theme") === "dark";
      // Esri grey canvas without the reference (labels) layer, so no place names appear
      return "https://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_" + (dark ? "Dark" : "Light") + "_Gray_Base/MapServer/tile/{z}/{y}/{x}";
    };

    var map = L.map("places-map", { scrollWheelZoom: false, worldCopyJump: true });
    var tiles = L.tileLayer(tileUrl(), {
      maxZoom: 10,
      attribution: "Tiles &copy; Esri &mdash; Esri, DeLorme, NAVTEQ",
    }).addTo(map);

    var markers = places.map(function (p) {
      var popup = "<strong>" + p.name + "</strong>" + (p.text ? "<br>" + p.text : "") + '<br><a href="' + p.page.url + '">' + p.page.title + "</a>";
      return L.circleMarker([p.lat, p.lon], { radius: 7, weight: 2, color: "#ffffff", fillColor: accent(), fillOpacity: 0.9 })
        .bindTooltip(p.name)
        .bindPopup(popup)
        .addTo(map);
    });
    map.fitBounds(L.featureGroup(markers).getBounds(), { padding: [25, 25] });

    new MutationObserver(function () {
      tiles.setUrl(tileUrl());
      markers.forEach(function (m) { m.setStyle({ fillColor: accent() }); });
    }).observe(root, { attributes: true, attributeFilter: ["data-theme"] });
  });
</script>
