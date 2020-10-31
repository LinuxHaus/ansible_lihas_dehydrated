# lihas_dehydrated

Install dehydrated with http-01, test domains against staging and finally deploy them for real.

## Requirements

As of now this role provides the SSL-certificates for lihas-apache reverse proxy

## Role Variables

```
LIHASVARS:
  variables:
    LETSENCRYPTMAIL: a@example.com
  roles:
    rproxy:
      domains:
        DOMAINNAME:
%:
  config:
    roles:
      rproxy:
        domains:
          DOMAINNAME:
```

## Dependencies

* lihas_variables

## Example Playbook
