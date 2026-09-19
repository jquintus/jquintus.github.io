---
title: Projects
---

{% assign repositories = site.github.public_repositories | where: "has_pages", true | sort: "name" %}
{% for repository in repositories %}
{% unless repository.name == site.github.repository_name %}
{% assign project_url = "/" | append: repository.name | append: "/" %}
## [{{ repository.name }}]({{ project_url }})

{{ repository.description }}

[Open project]({{ project_url }}) · [Source]({{ repository.html_url }})

_Updated {{ repository.pushed_at | date: "%B %-d, %Y" }}_

{% endunless %}
{% endfor %}
