#!/bin/sh

if [ -z "$VAST_ENDPOINT" ]; then
  echo "VAST_ENDPOINT is required"
  exit 1
fi

if [ -z "$ORIGIN_URL" ]; then
  echo "ORIGIN_URL is required"
  exit 1
fi

/app/ad_proxy 0.0.0.0 ${PORT:-8080} \
  ${VAST_ENDPOINT} \
  ${ORIGIN_URL} \
  --ad-insertion-mode ${INSERTION_MODE:-static} \
  --interstitials-address https://${OSC_HOSTNAME}
