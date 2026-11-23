# paolobecciu.com

Source of [paolobecciu.com](https://paolobecciu.com), the website of Paolo Becciu, movement
ecologist at the Swiss Ornithological Institute. Built with the
[al-folio](https://github.com/alshedivat/al-folio) Jekyll starter (MIT licence) and deployed to
GitHub Pages.

## Quick start

```bash
bundle install
bundle exec jekyll serve   # → http://localhost:4000/
```

Requires Ruby 3.3, Bundler and ImageMagick. Pushing to `main` builds and deploys the site
through GitHub Actions; in the repository's **Settings → Pages**, the source must be the
`gh-pages` branch.

## Everyday edits

| To…                    | Edit                                                              |
| ---------------------- | ----------------------------------------------------------------- |
| add a paper            | `_bibliography/papers.bib` (or `/add-paper <DOI>` in Claude Code) |
| add a news item        | `_news/` (or `/add-news`)                                         |
| update the CV          | replace `assets/pdf/cv.pdf` (or `/update-cv <file>`)              |
| change a research page | `_projects/<name>.md`                                             |
| change the home page   | `_pages/about.md`                                                 |

`CLAUDE.md` has the full content rules; `.claude/commands/` has the Claude Code shortcuts.

## Migration status

- [ ] `bash bin/fetch-wordpress-media.sh` run and images committed
- [ ] Referee-free `assets/pdf/cv.pdf` added
- [ ] `TODO` comments resolved (`grep -rn TODO _pages _projects _news _data`)
- [ ] Google Scholar ID in `_data/socials.yml`
- [ ] Domain cutover: `CNAME`, `url:` in `_config.yml`, DNS, HTTPS
