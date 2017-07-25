---
layout: default
title: {{ site.title }}
---
## Welcome!

Below you will find a historical stash of blog posts along with some long-lasting documents and projects. 

## Documents
- [Cosmostats](docs/cosmostats.pdf) -- a *massive* compilation of statistical knowledge started while in grad school.
- [My CV](docs/rspeare_cv.pdf) -- a genuine, green and over-enthusiastic resume.
- [fastSPT](docs/fastSPT.pdf) -- what I used to work on in Physics (pretty graphs).
<div id="home">
  <h2>Blog Posts</h2>
  <ul class="posts">
    {% for post in site.posts %}
      <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
  </ul>
</div>
