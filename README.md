# Hjalte Bested Hjorth – portfolio

Projects and blog, live at <https://roboticaudio.com/hjalte> (GitHub Pages, Jekyll, published from `master`).
It shares its look with [tromleorkestret.com](https://tromleorkestret.com) and [roboticaudio.com](https://roboticaudio.com).

## Run locally

```bash
bundle install
LANG=en_US.UTF-8 bundle exec jekyll serve --livereload --drafts
```

Then open <http://localhost:4000/hjalte/>. `--drafts` also shows the posts in `_drafts/`.

## Where things live

| What | Where |
| --- | --- |
| Front page | `index.html` |
| Projects | `_projects/` → `/hjalte/<file-name>` |
| Blog posts | `_posts/` → `/hjalte/blog/<title>/` |
| Unpublished posts | `_drafts/` (never on the live site) |
| Projects, Blog, About, Contact pages | `_pages/` |
| Menu, hero, "What I do", social links | `_data/settings.yml` |
| Styles / scripts | `assets/css/main.css`, `assets/js/main.js` |
| Card and hero images | `images/thumbs/` (made by `tools/make-thumbs.sh`) |

## Adding a project

Create `_projects/my-project.md`:

```yaml
---
layout: project
date: 2026-10-02      # only used for the order: newest first
title: My Project
description: One sentence shown on the cards and under the title.
image: '/images/my-project/photo.jpg'
tags: [Creative-Tech, Music]
featured: false       # true = one of the two wide cards on the front page
---
Markdown content…
```

Then run `tools/make-thumbs.sh` to make the web-sized copies of its image.
The tags become the filter buttons on the Projects page (a `-` shows as a space).

## Writing a blog post

Create `_posts/2026-10-02-my-title.md`:

```yaml
---
title: My title
description: One sentence shown in the list and under the title.
image: '/images/…jpg'   # optional
tags: [Notes]           # optional
---
Markdown content…
```

It appears on the Blog page, on the front page under "Latest writing" (that section shows up with the
first post) and in the RSS feed (`/hjalte/feed.xml`). `_drafts/writing-a-blog-post.md` is a sample to copy from.

## Content helpers

- `{% include youtube.html id="VIDEO_ID" title="Optional title" %}` – click-to-play YouTube video.
- `![]({{site.baseurl}}/images/…jpg#wide)` – edge-to-edge photo; `#right` floats it to the right.
- A line in italics straight under a photo becomes its caption.
- `<div class="gallery-box"><div class="gallery"><img src="…">…</div><p class="gallery-caption">Caption</p></div>` – photo grid with lightbox.
- `<div class="wide">…</div>` – let something be wider than the text column.
- `<iframe>` videos (YouTube, Google Drive, Vimeo) fill the column; give `width` and `height` to set the shape (e.g. `width=9 height=16` for portrait).
