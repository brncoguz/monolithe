# -*- coding: utf-8 -*-
"""

NUEnterprisePermission
This file has been autogenerated by Swagger  and should not be modified.

Author Christophe Serafin <christophe.serafin@alcatel-lucent.com>

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 3.0 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

"""

from bambou import NURESTObject



class NUEnterprisePermission(NURESTObject):
    """ Represents a EnterprisePermission object in Nuage VSD solution
        IMPORTANT: Do not override this object.
    """

    def __init__(self, **kwargs):
        """ Initialize a NUEnterprisePermission instance """

        super(NUEnterprisePermission, self).__init__()

        # Read/Write Attributes
        self.permitted_entity_id = None  #  The enterprise permitted to use/extend  this Gateway - int
        self.name = None  #  Name of the  Permission - int
        self.permitted_action = None  #  The permitted  action to USE/EXTEND/READ/INSTANTIATE  an entity - int
        self.permitted_entity_description = None  #  Description for the permittedEntity - int
        self.permitted_entity_name = None  #  Name of the entity for which we have given permission. - int
        self.permitted_entity_type = None  #  Type of the entity for which we have given permission. - int
        
        self.expose_attribute(local_name=u"permitted_entity_id", remote_name=u"permittedEntityID", attribute_type=int)
        self.expose_attribute(local_name=u"name", remote_name=u"name", attribute_type=int)
        self.expose_attribute(local_name=u"permitted_action", remote_name=u"permittedAction", attribute_type=int)
        self.expose_attribute(local_name=u"permitted_entity_description", remote_name=u"permittedEntityDescription", attribute_type=int)
        self.expose_attribute(local_name=u"permitted_entity_name", remote_name=u"permittedEntityName", attribute_type=int)
        self.expose_attribute(local_name=u"permitted_entity_type", remote_name=u"permittedEntityType", attribute_type=int)
        
        # Fetchers
        for key, value in kwargs.iteritems():
            if hasattr(self, key):
                setattr(self, key, value)



    @classmethod
    def get_remote_name(cls):
        """ Remote name that will be used to generates URI """

        return u"enterprisepermission"

