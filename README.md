# freeradius-azuread
FreeRadius server with the freeradius LDAP extension. Configured for use with AzureAD LDAPS.
It uses only LDAPS (port 636) and no certificate gets verified.

Environment Variables
=====================

- `LDAP_HOST` - LDAP server hostname(s) (default: "ldap1.example.ch")
- `LDAP_USER` - LDAP server user (example: "CN=LDAPUserAccount,OU=AADDC Users,DC=domain,DC=ch")
- `LDAP_PASS` - LDAP server password (default: "password")
- `LDAP_BASEDN` - LDAP server Base DN (example: "OU=AADDC Users,DC=domain,DC=ch")

- `CLIENT_NET` - RADIUS client network (default: "10.10.12.0/24")
- `CLIENT_SECRET` - RADIUS client secret (default: "Testing123")
