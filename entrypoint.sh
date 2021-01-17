#!/bin/bash

ldap_subst() {
    sed -i -e "s/${1}/${2}/g" /etc/freeradius/3.0/mods-enabled/ldap
}
client_subst() {
    sed -i -e "s/${1}/${2}/g" /etc/freeradius/3.0/clients.conf
}

# substitute variables into LDAP configuration file
ldap_subst "@LDAP_HOST@" "${LDAP_HOST}"
ldap_subst "@LDAP_USER@" "${LDAP_USER}"
ldap_subst "@LDAP_PASS@" "${LDAP_PASS}"
ldap_subst "@LDAP_BASEDN@" "${LDAP_BASEDN}"

# substitute variables into CLIENTS configuration file
client_subst "@CLIENT_SECRET@" "${CLIENT_SECRET}"

echo "client network-range { 
    	ipaddr		= $CLIENT_NET
    	secret          = $CLIENT_SECRET 
    	require_message_authenticator = no
}" >> /etc/freeradius/3.0/clients.conf


freeradius -f
