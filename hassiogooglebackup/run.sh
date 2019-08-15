#!/bin/sh


OPTIONS_PATH=/data/options.json

GB_DEBUG="$(jq --raw-output '.debug' $OPTIONS_PATH)"
GB_VERSION="1.7.0"

INGRESS_IP="$(curl -H 'X-HASSIO-KEY: ${HASSIO_TOKEN}' 'http://hassio/addons/self/info' | jq -r '.ip_address')"

echo "GB_DEBUG = $GB_DEBUG"
echo "GB_VERSION = $GB_VERSION"
echo "INGRESS_IP = $INGRESS_IP"

export GB_DEBUG
export GB_VERSION

cd googlebackup
python manage.py runserver --noreload $INGRESS_IP:8099