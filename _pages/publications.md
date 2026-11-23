---
layout: page
permalink: /publications/
title: publications
nav: true
nav_order: 3
---

<!-- Generated from _bibliography/papers.bib. Do not type citations on this page. -->

Also on [Google Scholar](https://scholar.google.com/citations?user={{ site.data.socials.scholar_userid }}), [ResearchGate](https://www.researchgate.net/profile/{{ site.data.socials.research_gate_profile }}) and [ORCID](https://orcid.org/{{ site.data.socials.orcid_id }}). Open-access articles are free to read through their DOI links.

{% include bib_search.liquid %}

<div class="publications">

<!-- Entries with hide_publications = {true} in papers.bib are left out here but still
     appear on their research pages. -->

{% bibliography --query @*[hide_publications!=true] %}

</div>
