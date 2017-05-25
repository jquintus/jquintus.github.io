---
show_fork: true
---

## Recent posts

{% for post in site.posts reversed %}
* [{{ post.title }}]({{ post.url }}) posted on {{ post.date | date_to_long_string }}
{% endfor %}

## Some useful links

* [The Software List](pages/software)
* [Markdown Cheat Sheet](pages/markdown_cheat_sheet.html)
* [About](pages/about)
