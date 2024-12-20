# lihas_dehydrated

Install dehydrated with http-01, test domains against staging and finally deploy them for real.

Live dehydrated will only be run if the contents of /etc/dehydrated/domains.txt have changed.

## Requirements

As of now this role provides the SSL-certificates for lihas_apache reverse proxy or directly named domains

To run solo:
```
ansible-galaxy install -r requirements.yml
ansible-playbook -i localhost, dehydrated.yml
```
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
%:
  config:
    roles:
      dehydrated:
        domains:
          DOMAINNAME: ~
# list of services to reload after certificate deploy
%.config.roles.dehydrated.services.reload: []
# list of services to restart after certificate deploy
%.config.roles.dehydrated.services.restart: []
# complete commands to call for 'deploy_challenge' in /usr/local/bin/dehydrated-hook.sh
%.config.roles.dehydrated.plugins.deploy_challenges: []
# complete commands to call for 'clean_challenge' in /usr/local/bin/dehydrated-hook.sh
%.config.roles.dehydrated.plugins.clean_challenges: []
# commands to call for 'deploy_cert' in /usr/local/bin/dehydrated-hook.sh, wikll have additional parameters "$DOMAIN" "$KEYFILE" "$CERTFILE" "$FULLCHAINFILE" "$CHAINFILE" "$TIMESTAMP"
%.config.roles.dehydrated.plugins.deploy_cert: []
```

## Dependencies

* lihas_variables
* lihas_apache

## Example Playbook
```
---
- hosts: '*'
  role: lihas_dehydrated
...
```
## Manual testsA
The playbook requests staging certificates on each run unless a valid saging certificate is already present.

If manual debugging is needed you can use staging by touching `/tmp/dehydratedtest`, don't forget to remove it afterwards.
