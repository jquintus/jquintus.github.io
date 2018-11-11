---
title: Josh's CV
---

## Contact

## About

## Work

{% for job in site.data.resume.experience %}

{% if job.website %}

### [{{ job.company }}]({{ job.website }})

{% else %}

### {{ job.company }}

{% endif %}

{% capture position %}
{{ job.position }}
{% endcapture %}

{% capture date %}
{{ job.startDate | date: "%B %Y"}} &mdash; {{ job.endDate| date: "%B %Y"}}
{% endcapture %}

{% include leftItalic_right.html left=position right=date %}

{% for highlight in job.highlights %}
* {{ highlight }} {% endfor %}

{% endfor %}

## Projects

## Skills

## Education