# -*- coding: utf-8 -*-

# Copyright 2014 Alcatel-Lucent USA Inc.
# NU{{ model.name }}
# {{ model.description }}

{% for relation in model.relations %}
from ..fetchers import NU{{ relation.plural_name }}Fetcher{% endfor %}
from bambou import NURESTBasicUser{% if model.has_time_attribute %}
from time import time{% endif %}


class NU{{ model.name }}(NURESTBasicUser):
    """ Represents a {{ model.name }} object

        IMPORTANT: This file has been autogenerated. Do not override it !

    """

    def __init__(self, **kwargs):
        """ Initializes a {{ model.name }} instance

        """
        super(NU{{ model.name }}, self).__init__()

        # Read/Write Attributes
        {% for attribute in model.attributes %}
        self._{{ attribute.local_name|lower }} = None{% endfor %}
        {% for attribute in model.attributes %}
        self.expose_attribute(local_name=u"{{ attribute.local_name|lower }}", remote_name=u"{{ attribute.remote_name }}", attribute_type={{ attribute.local_type }}{% if attribute.is_required %}, is_required=True{% endif %}{% if attribute.is_unique %}, is_unique=True{% endif %}{% if attribute.choices %}, choices={{ attribute.choices|sort|trim }}{% endif %}){% endfor %}
        {% if model.relations|length > 0 %}
        # Fetchers
        {% for relation in model.relations %}
        self.{{ relation.instance_plural_name }} = []
        self.{{ relation.instance_plural_name }}_fetcher = NU{{ relation.plural_name }}Fetcher.fetcher_with_object(nurest_object=self, local_name=u"{{relation.instance_plural_name}}")
        {% endfor %}{% endif %}
        for key, value in kwargs.iteritems():
            if hasattr(self, key):
                setattr(self, key, value)

    # Properties
    {% for attribute in model.attributes %}
    def _get_{{ attribute.local_name }}(self):
        """ Get attribute {{ attribute.local_name }}

            {{ attribute.description }}

        """
        return self._{{ attribute.local_name }}

    def _set_{{ attribute.local_name }}(self, value):
        """ Set attribute {{ attribute.local_name }}

            {{ attribute.description }}

        """
        self._{{ attribute.local_name }} = value

    {{ attribute.local_name }} = property(_get_{{ attribute.local_name }}, _set_{{ attribute.local_name }})
    {% endfor %}
    # Methods

    @classmethod
    def get_remote_name(cls):
        """ Remote name that will be used to generates URI

        """
        return u"{{ model.remote_name }}"

    @classmethod
    def is_resource_name_fixed(cls):
        """ Fixed resource name """

        return True

    def get_resource_url(self):
        """ Get resource complete url

            Returns:
                Retrns a complete url containing /me
        """

        name = self.__class__.get_resource_name()
        url = self.__class__.base_url()
        return "%s/%s" % (url, name)

    def get_resource_url_for_child_type(self, object_type):
        """ Get the resource url for the object type """

        return "%s/%s" % (self.__class__.base_url(), object_type.get_resource_name())
