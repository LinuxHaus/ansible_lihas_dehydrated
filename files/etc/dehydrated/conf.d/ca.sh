if [ -e /tmp/dehydratedtest ]; then
  CA="https://acme-staging-v02.api.letsencrypt.org/directory"
  CERTDIR="/var/lib/dehydrated/certs-staging"
fi
