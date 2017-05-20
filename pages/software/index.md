---
title: "Software"
description: ""
---

## Useful software

{% assign software_by_category = site.software | sort: "category" | group_by:"category"  %}

### Categories
{% for category in software_by_category %}
* [{{category.name}}](#{{category.name | slugify }})
{% endfor %}

-------------------------------

{% for category in software_by_category %}

### {{category.name}}

{% for tool in category.items %}
#### [{{tool.name}}]({{tool.link}})
{{tool.content}}

{% endfor %}

{% endfor %}
