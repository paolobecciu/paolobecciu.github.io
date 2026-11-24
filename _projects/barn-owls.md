---
layout: page
title: Barn owls at night, unveiled
description: How do individual traits and ambient light shape a nocturnal predator's behaviour? High-resolution tracking of barn owls in Switzerland.
importance: 2
# img: assets/img/research/barn-owls.jpg # TODO: one field photo
---

**Status:** 2020–2025 at the University of Lausanne, with papers still appearing · [Barn Owl Research Group](https://barnowl-research.ch/en)

From 2020 to 2025 I worked with the Barn Owl Research Group at the University of Lausanne, analysing high-resolution GPS-accelerometer tracks of wild barn owls (_Tyto alba_) breeding in western Switzerland. The data let us count, night by night, how many prey each parent caught, delivered or kept, and so study behaviour that is invisible to direct observation. The common thread was how individual traits, such as sex and plumage colour, interact with conditions, such as moonlight, to shape hunting and parental care.

### Key findings

- Cooperation between barn owl parents in provisioning their chicks is context-dependent and adjusted in real time, and it carries fitness pay-offs ([Becciu et al. 2025, _iScience_](https://doi.org/10.1016/j.isci.2025.113533)).

  <blockquote class="bluesky-embed" data-bluesky-uri="at://did:plc:vao5ee4okhdimw4r4372pv6r/app.bsky.feed.post/3m3tw6jxhgk2o" data-bluesky-cid="bafyreif3t4h5krvwtu5okuwjxxdfo3kj3yflk7tye6lcexxsvjckn3edqm" data-bluesky-embed-color-mode="system"><p lang="en">New paper out<br>Our study reveals how barn owl parents coordinate nightly chick feeding. Females step up when males underperform &amp; pairs that meet more often at the nest share work more equally boosting chick survival</p>&mdash; Paolo Becciu (<a href="https://bsky.app/profile/did:plc:vao5ee4okhdimw4r4372pv6r?ref_src=embed">@pbecciu.bsky.social</a>) <a href="https://bsky.app/profile/did:plc:vao5ee4okhdimw4r4372pv6r/post/3m3tw6jxhgk2o?ref_src=embed">23 October 2025</a></blockquote>
- Plumage colour morphs hunt differently under moonlight, with white owls turning bright nights into a hunting advantage ([Schalcher et al. 2026, _Current Biology_](https://doi.org/10.1016/j.cub.2026.05.020)).

  <blockquote class="bluesky-embed" data-bluesky-uri="at://did:plc:vao5ee4okhdimw4r4372pv6r/app.bsky.feed.post/3mnywp5bc7k2c" data-bluesky-cid="bafyreifrncselnnoyhxkre4d4q3vifxktw4rgeg42hhqkqfzt46lr5kzbq" data-bluesky-embed-color-mode="system"><p lang="en">Very happy to share our new paper out in @currentbiology.bsky.social!<br><br>We show that barn owl colour morphs do not simply experience moonlight differently — they hunt differently under it.<br><br>White morphs appear to turn bright moonlight into a hunting advantage.</p>&mdash; Paolo Becciu (<a href="https://bsky.app/profile/did:plc:vao5ee4okhdimw4r4372pv6r?ref_src=embed">@pbecciu.bsky.social</a>) <a href="https://bsky.app/profile/did:plc:vao5ee4okhdimw4r4372pv6r/post/3mnywp5bc7k2c?ref_src=embed">11 June 2026</a></blockquote>
- Measuring landing force revealed a previously unknown form of motion-induced sound camouflage in a wild predator ([Schalcher et al. 2024, _eLife_](https://doi.org/10.7554/eLife.87775)).
- Prospecting movements before breeding link female phenotype to annual reproductive potential ([Becciu et al. 2023, _Scientific Reports_](https://doi.org/10.1038/s41598-023-32255-7)).

**Methods:** behavioural metrics computed from GPS-accelerometer tracks: nightly hunting effort, prey deliveries, self-feeding, nest attendance and provisioning shares; partner encounters and synchronised foraging and nest visits; (re)visits to other nest boxes (prospecting); hierarchical and time-to-event models.
**Collaborators:** Alexandre Roulin, Bettina Almasi, Kim Schalcher and the Barn Owl Research Group; Emily Shepard (Swansea University, Wales, UK); Andrea Romano (University of Milan, Italy); James Savage (Southern Institute of Technology, New Zealand); the Goudet group (University of Lausanne, barn owl population genomics).

### Publications

<div class="publications">

{% bibliography --group_by none --query @*[keywords~=barnowl] %}

</div>

<!-- Bluesky post embeds: the quotes above work on their own; Bluesky's official embed script
     replaces them with the full posts, loaded last so a slow Bluesky never holds up the page. -->
<script>
  window.addEventListener("load", function () {
    var dark = document.documentElement.getAttribute("data-theme") === "dark";
    document.querySelectorAll("blockquote.bluesky-embed").forEach(function (b) {
      b.setAttribute("data-bluesky-embed-color-mode", dark ? "dark" : "light");
    });
    var s = document.createElement("script");
    s.async = true;
    s.src = "https://embed.bsky.app/static/embed.js";
    s.charset = "utf-8";
    document.body.appendChild(s);
  });
</script>
