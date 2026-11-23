---
description: Add a publication to papers.bib from a DOI, plus a news item
argument-hint: <DOI> [joint authorship or other note]
---

Add the publication with DOI $ARGUMENTS to `_bibliography/papers.bib`.

1. Look up the metadata from the DOI (doi.org content negotiation or Crossref). Do not guess
   any field you cannot find; leave a `% TODO` comment instead.
2. Write the entry in the style of the existing entries: key `firstauthorYEARword`, authors as
   "Last, F." with me as "Becciu, Paolo", `abbr`, `journal`, `volume`, `pages`, `year`, `doi`,
   `bibtex_show = {true}`, and `keywords` (one of dispersal, barnowl, flight, seabird — ask me
   if it is unclear). Add `note = {Open access}` only if the article is open access.
3. If the abbreviation is new, add it to `_data/venues.yml` with the journal URL.
4. If an "In press" entry for the same paper already exists, replace it rather than duplicating.
5. Draft a one-sentence `_news/` item for it and show it to me before saving.
6. Run `bundle exec jekyll build` and confirm the entry renders on /publications/ and on the
   right research page.
