---
layout: resume

---

{{ site.data.resume.about.summary }}

**Email:** {{ site.data.resume.about.email }}  **Phone:** {{ site.data.resume.about.phone }} {% for profile in site.data.resume.about.profiles %}[{{ profile.display }}]({{ profile.url }}) {% endfor %}

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
{% for project in site.data.resume.projects %}
  {% capture description %}
  {{ project.description }}
  {% endcapture %}

  {% capture date %}
  {{ project.date| date: "%B %Y"}}
  {% endcapture %}

### [{{ project.name }}]({{ project.website }})
{% include leftItalic_right.html left=description right=date %}

{% for highlight in project.highlights %}
* {{ highlight }} {% endfor %}

{% endfor %}

## Skills

{% for skill in site.data.resume.skills %}

### {{ skill.name }}

{{ skill.keywords | join: ', ' }}

{% endfor %}

## Education

{% for training in site.data.resume.education %}
  {% capture area %}
  {{ training.area }}
  {% endcapture %}

  {% capture date %}
    {% if training.date %} 
      {{ training.date | date: "%B %Y" }} 
    {% else %}
      {{ training.endDate| date: "%B %Y"}}
    {% endif %}
  {% endcapture %}

### {{ training.name }}

{% include leftItalic_right.html left=area right=date %}

**Topics:** {{ training.courses | join: ', ' }}

{% endfor %}
