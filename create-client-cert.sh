#!/bin/bash

echo ""
echo "#-#"
echo ""
echo "  Creates and extracts the <client-name>.p12 cert from the tak container and copies it to the ./certs directory."
echo ""
echo "#-#"

if [ "$#" -ne 1 ]; then
  echo ""
  echo "ERROR: Missing required argument <client-name>"
  echo ""
  echo "  - Usage: $0 <client-name>"
  exit 1
fi

CLIENT=$1

mkdir -p ./certs

echo ""
docker compose exec tak bash -c "cd /opt/tak/certs && ./makeCert.sh client $CLIENT"

echo ""
docker compose cp tak:/opt/tak/certs/files/$CLIENT.p12 ./certs/$CLIENT.p12

echo ""
echo "#############################################"
echo ""
echo "  DONE - Cert copied to ./certs/$CLIENT.p12"
echo ""
echo "#############################################"