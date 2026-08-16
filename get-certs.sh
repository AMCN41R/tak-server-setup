#!/bin/bash

echo ""
echo "#-#"
echo ""
echo "  Extracts the admin.p12, root-ca.pem, and truststore-root.p12 certs from the tak container and copies them to ./certs/admin"
echo ""
echo "#-#"

mkdir -p ./certs/admin

echo ""
docker compose cp tak:/opt/tak/certs/files/admin.p12 ./certs/admin/admin.p12
docker compose cp tak:/opt/tak/certs/files/root-ca.pem ./certs/admin/root-ca.pem
docker compose cp tak:/opt/tak/certs/files/truststore-root.p12 ./certs/admin/truststore-root.p12

echo ""
echo "########################################"
echo ""
echo "  DONE - Certs copied to ./certs/admin"
echo ""
echo "########################################"