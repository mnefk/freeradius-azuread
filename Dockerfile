# Use Base Ubuntu image
FROM ubuntu:20.04

# Author of this Dockerfile
MAINTAINER mnefk <x12.ch>

# Update & upgrades
RUN apt-get update && apt-get dist-upgrade -y

# Install FreeRADIUS and LDAP
RUN apt-get install freeradius freeradius-ldap freeradius-utils -y

#Variables
ENV LDAP_HOST "ldap1.example.com"
ENV LDAP_USER "LDAPUSER-CN DN DC"
ENV LDAP_PASS "password"
ENV LDAP_BASEDN "BASEDN DC"
ENV CLIENT_NET "10.10.12.0/24"
ENV CLIENT_SECRET Testing123

# Copy existing /etc/freeradius/3.0/mods-enabled/ldap file to container
COPY ldap /etc/freeradius/3.0/mods-enabled/ldap

# Copy existing /etc/freeradius/3.0/sites-enabled/default file to container
COPY default /etc/freeradius/3.0/sites-enabled/default

# Copy existing /etc/freeradius/3.0/clients.conf file to container
COPY clients.conf /etc/freeradius/3.0/clients.conf

# Copy entrypoint bash-script
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

# Expose the port
EXPOSE 1812/udp 1813/udp 18120/udp

# Run FreeRADIUS
#CMD freeradius -X
ENTRYPOINT ["/entrypoint.sh"]
