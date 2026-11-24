# CLAUDE.md — paolobecciu.com

Personal academic website of Paolo Becciu, movement ecologist. Built on the
[al-folio](https://github.com/alshedivat/al-folio) v1.x Jekyll starter, deployed to
GitHub Pages by `.github/workflows/deploy.yml` (builds on push to `main`, publishes the
`gh-pages` branch).

`AGENTS.md` describes the upstream al-folio starter. Read it for how the starter and its
plugin gems fit together, but where it conflicts with this file, **this file wins**: this
site has an empty `baseurl`, no example content, no blog and no upstream test suite.

## Commands

```bash
bundle install                 # Ruby gems (first run, and after Gemfile changes)
npm ci                         # Prettier only
bundle exec jekyll serve       # preview at http://localhost:4000/  (baseurl is empty)
bundle exec jekyll build       # production-style build into _site/
npx prettier . --check         # formatting, as CI expects
```

ImageMagick (`convert` / `magick`) must be on PATH for the build (responsive images).

## Verifying changes

Verify changes in one of two ways:

- **GitHub Actions:** push to `main`, then `gh run watch` the "Deploy site" run until it
  passes (`gh run view --log-failed` if it fails).
- **Codespace:** open a codespace on this repository; `bin/entry_point.sh` starts
  `jekyll serve` on port 8080 (Ports tab → open the 8080 address). Run Prettier there
  (`npx prettier . --check`).

## Where things live

| Content                  | File(s)                                                         |
| ------------------------ | --------------------------------------------------------------- |
| Publications (all pages) | `_bibliography/papers.bib` — the ONLY place papers are edited   |
| Home page text           | `_pages/about.md`                                               |
| Research pages           | `_projects/*.md` → `/research/<name>/`, ordered by `importance` |
| News items               | `_news/*.md` (newest five appear on the home page)              |
| Upcoming events          | `_data/upcoming.yml` (home page, until each event's end date)   |

| Photography              | `_data/photos.yml` + files in `assets/img/photos/`              |
| Contact / social icons   | `_data/socials.yml`                                             |
| Journal badges           | `_data/venues.yml` (key = `abbr` in papers.bib)                 |
| CV PDF                   | `assets/pdf/cv.pdf` — always this filename                      |
| Old WordPress URLs       | `_pages/redirects/*.html` (meta-refresh pages)                  |

## Content rules

1. **One source per fact.** Never type a citation on a page. Research pages list papers with
   `{% bibliography --query @*[keywords~=<tag>] %}`; tags are `dispersal`, `barnowl`,
   `flight`, `seabird`.
2. **papers.bib entries** use `abbr` (must exist in `_data/venues.yml`), `keywords`, `doi`,
   `bibtex_show = {true}`, and `note` for status (e.g. `In press`). Mark joint authorship
   with `*` after the surname (`Becciu*, Paolo`) plus `annotation = {* joint senior authors}`.
   At most six entries carry `selected = {true}`; they appear on the home page. Selected
   papers are ones Paolo led (first or senior author), not co-authored papers.
   Never link publisher PDFs; `pdf` is for accepted manuscripts or own proceedings only.
3. **No undated time words in page text.** No "currently", "soon", "stay tuned", "recently".
   Use a dated status line on research pages; put time-bound items in `_news/`.
4. **News items** are one or two sentences, `inline: true`, dated in front matter, file name
   `YYYY-MM-short-slug.md`. Never date one in the future (Jekyll hides it). Upcoming talks and
   meetings go in `_data/upcoming.yml`, not in `_news/`; add a news item after the event if wanted.
5. **Do not publish:** referees or their emails, unpublished results from the natal dispersal
   dataset, other people's private details, or Paolo's personal plans.
6. **Facts must come from Paolo or a source.** If a detail (date, place, co-author, finding)
   is not in the repo or the conversation, leave a `<!-- TODO: ... -->` comment rather than
   guessing.
7. British spelling, plain language, short paragraphs. Research-page summaries ≤ 120 words.

## Do not touch

- `_layouts/`, `_includes/`, `_sass/` hold only deliberate local overrides, each recorded in
  `.al-folio-overrides.yml` (so far `_includes/news.liquid`: month-and-year news dates;
  `_includes/footer.liquid`: "© year name" only; `_layouts/about.liquid`: portrait alt text
  from `profile.image_alt`, the "upcoming events" list above the news, and the edge-to-edge
  home banner from `banner.image` / `banner.alt`). Other layout
  changes belong in the al-folio gems or in a new deliberate override; after any change run
  `bundle exec al-folio upgrade overrides audit` and `... overrides accept <path>`.
- `Gemfile` and `_config.yml` `plugins:` must list the same plugins.
- Do not add a `CNAME` file until the domain cutover (it would redirect the preview to WordPress).

## Before committing

Build cleanly (`bundle exec jekyll build`), check the pages you touched at
`localhost:4000`, run Prettier, and commit with a message that says what changed for a reader
of the site (e.g. "Add Science 2026 paper and news item").
