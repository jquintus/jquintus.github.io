---
title: Projects
---

{% assign repositories = site.github.public_repositories | where: "has_pages", true | sort: "name" %}
{% for repository in repositories %}
{% unless repository.name == site.github.repository_name %}
{% assign project_url = "/" | append: repository.name | append: "/" %}
<div class="project-heading">
  <h2>
    <a href="{{ project_url }}">{{ repository.name }}</a>
    <span class="project-source">(<a href="{{ repository.html_url }}">source</a>)</span>
  </h2>
</div>

{{ repository.description }}

{% endunless %}
{% endfor %}
