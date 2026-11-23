---
layout: page
permalink: /teaching/
title: teaching & mentoring
description: Students I have supervised, courses I have taught, and editorial service.
nav: true
nav_order: 4
published: false # removed from the site; file kept for reference (its supervision table read a data file that no longer exists)
---

<!-- TODO: two sentences on how you supervise and what kinds of projects you can host. -->

I have supervised or co-supervised twelve students and interns, from internships to a PhD. Depending on capacity at the moment of request, students interested in a project on natal dispersal, migration of soaring birds, or seabird monitoring and tracking are welcome to [get in touch](/contact/).

### Supervision

<table class="table table-sm">
  <thead>
    <tr><th>Name</th><th>Level</th><th>Institution</th><th>Year</th></tr>
  </thead>
  <tbody>
  {% for m in site.data.mentees %}
    <tr>
      <td>{{ m.name }}{% if m.project %}<br><small>{{ m.project }}</small>{% endif %}{% if m.next %}<br><small>Now: {{ m.next }}</small>{% endif %}</td>
      <td>{{ m.level }}</td>
      <td>{{ m.institution }}</td>
      <td>{{ m.year }}</td>
    </tr>
  {% endfor %}
  </tbody>
</table>

### Teaching

| Years     | Course                               | Institution                 | Role                                                                                |
| --------- | ------------------------------------ | --------------------------- | ----------------------------------------------------------------------------------- |
| 2023–2025 | Introduction to Conservation Biology | University of Lausanne      | Teaching assistant: students' news-and-views articles, research proposals and talks |
| 2022–2024 | Population Biology                   | University of Lausanne      | Teaching assistant: as above, on conservation and population biology                |
| 2021      | Experimental Design                  | University of Lausanne      | Field practicals: planning, data collection, analysis and reporting                 |
| 2021      | The Diversity of Life: Zoology       | University of Lausanne      | Practical assistant: dissection and field data collection                           |
| 2018      | Bird Migration                       | University of Haifa         | Guest lecture: effects of weather and climate change on migrating birds             |
| 2011      | Zoology I                            | Sapienza University of Rome | Laboratory tutor                                                                    |

### Editorial and review service

- Associate Editor, [_New Zealand Journal of Zoology_](https://rsnz.onlinelibrary.wiley.com/journal/11758821), since November 2024.
- Member of the PhD thesis committee of Ramon Sager (University of Lausanne and Swiss Ornithological Institute).
- Reviewer for _Proceedings of the Royal Society B_, _Movement Ecology_, _Journal of Applied Ecology_, _Journal of Animal Ecology_, _Behavioral Ecology and Sociobiology_, _Ecosphere_, _Ecology and Evolution_, _Journal of Avian Biology_, _Ibis_, _Bird Study_, _Journal of Ethology_, _Climate Change Ecology_ and _PLoS ONE_.
