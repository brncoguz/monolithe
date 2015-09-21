{{ class_name }}
{{"=" * class_name|length }}

.. autoclass:: {{ module_name }}.{{ class_name }}

{% if property_names|length %}
Properties
----------
    {% for property_name in property_names %}
    .. autoattribute:: {{ module_name }}.{{ class_name }}.{{ property_name }}
    {% endfor %}
{% endif %}

{% if class_method_names|length %}
Class Methods
-------------
    {% for class_method_name in class_method_names %}
    .. automethod:: {{ module_name }}.{{ class_name }}.{{ class_method_name }}
    {% endfor %}
{% endif %}

{% if method_names|length %}
Methods
-------
    {% for method_name in method_names %}
    .. automethod:: {{ module_name }}.{{ class_name }}.{{ method_name }}
    {% endfor %}
{% endif %}

{% if inherited_method_names|length %}
Inherited Methods
-----------------
    {% for inherited_method_name in inherited_method_names %}
    .. automethod:: {{ module_name }}.{{ class_name }}.{{ inherited_method_name }}
    {% endfor %}
{% endif %}