---
description: Build the site and audit it for errors, stale text and broken links
---

1. Run `bundle exec jekyll build` and report any warnings or errors.
2. Check every internal link and asset in `_site/` (use lychee if installed:
   `lychee --offline '_site/**/*.html'`).
3. Confirm each old WordPress URL in `_pages/redirects/` resolves to an existing page.
4. Search page text in `_pages/`, `_projects/` and `_news/` for undated time words
   ("currently", "soon", "recently", "stay tuned", "in press" older than six months) and for
   leftover `TODO` comments; list them with file and line.
5. Check that every `abbr` in `_bibliography/papers.bib` exists in `_data/venues.yml`, and that
   no entry links a publisher PDF.
6. Report findings as a short list; fix nothing without asking.
