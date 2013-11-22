---
title: §508 Accessibility
layout: support-page
permalink: /accessibility/
description: ""
---

## **DRAFT DRAFT DRAFT DRAFT**

{% for section in site.data.accessibility %}
### {{ section[0] }}
  <table id="accessibility" class="table table-striped table-bordered table-condensed">
    <thead>
      <tr>
        <th>Criteria</th>
        <th>Level of Support</th>
        <th>Remarks and explanations</th>
      </tr>
    </thead>
    <tbody>
    {% for requirement in section[1] %}
      <tr>
        <td class="criterion">
        {% if section[0] == "Summary" %}
        <a href="#{{ requirement.criterion | replace:" ","-" | replace:".","" | replace:",","" | downcase }}">{{ requirement.criterion }}</a>
        {% else %}
         {{ requirement.criterion }}
        {% endif %}
        </td>
        <td class="support {{ requirement.support | downcase | replace:" ","-" }}">
         {{ requirement.support }}
        </td>
<td markdown="1" class="comments">
{{ requirement.comments }}
</td>
      </tr>
    {% endfor %}
    </tbody>
  </table>
{% endfor %}

## **DRAFT DRAFT DRAFT DRAFT**
