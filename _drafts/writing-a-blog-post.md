---
title: Writing a blog post
description: A sample post that shows what the blog can do. It lives in _drafts, so it is never published.
tags: [Notes]
# image: '/images/hjalte/HjalteBW_Entre.jpg'   # optional: a photo behind the title
---

This is a draft: it only shows up when the site runs with `--drafts`, never on the live site.
To publish a post, save it in `_posts/` as `YYYY-MM-DD-title.md`. It then appears on the Blog page,
on the front page under "Latest writing" and in the RSS feed.

## What goes in a post

Write in Markdown. The line under the title comes from `description`, and the date from the file name.

- **Photos**: `{% raw %}![]({{site.baseurl}}/images/giraf/top-labels.jpg){% endraw %}`, with `#wide` after the file name for edge to edge or `#right` to float it.
- *A line in italics right under a photo becomes its caption.*
- **Video**: `{% raw %}{% include youtube.html id="huHpao-UUPo" title="Giraf" %}{% endraw %}` loads YouTube only when clicked.

{% include youtube.html id="huHpao-UUPo" title="Giraf" %}

> Quotes look like this.

### Code

```cpp
float out = sampler.process() * gain;
```
