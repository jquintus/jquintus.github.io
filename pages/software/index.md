---
layout: page
title: "Software"
description: ""
---
{% include JB/setup %}

My list of useful software.

{% for tool in site.software %}
* [{{tool.name}}]({{tool.link}}) {{tool.description}}
{% endfor %}
