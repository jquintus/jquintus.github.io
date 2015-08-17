---
layout: page
title: "Software"
description: ""
---
{% include JB/setup %}

My list of useful software.

{% assign software_by_category = site.software | group_by:"category" %}


{% for category in software_by_category %}

## {{category.name}}

  {% for tool in category.items %}
* **[{{tool.name}}]({{tool.link}})** {{tool.description}}
  {% endfor %}

{% endfor %}
