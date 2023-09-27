#! /bin/bash

#Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}##### Creating self-signed certificate #####${NC}"

mkdir self-signed-cert
chmod 700 self-signed-cert

openssl genrsa -des3 -out self-signed-cert/domain.key 2048

openssl req -key self-signed-cert/domain.key -new -out self-signed-cert/domain.csr

echo -e "${GREEN}##### Creating a Self-Signed Certificate #####${NC}"

openssl x509 -signkey self-signed-cert/domain.key -in self-signed-cert/domain.csr -req -days 365 -out self-signed-cert/domain.crt

echo -e "${GREEN}##### Creating a CA-Signed Certificate With Our Own CA #####${NC}"

openssl req -x509 -sha256 -days 1825 -newkey rsa:2048 -keyout self-signed-cert/rootCA.key -out self-signed-cert/rootCA.crt

openssl x509 -req -CA self-signed-cert/rootCA.crt -CAkey self-signed-cert/rootCA.key -in domain.csr -out self-signed-cert/domain.crt -days 365 -CAcreateserial -extfile self-signed-cert/domain.text

openssl x509 -text -noout -in self-signed-cert/domain.crt

openssl x509 -in self-signed-cert/domain.crt -outform der -out self-signed-cert/domain.der

openssl pkcs12 -inkey self-signed-cert/domain.key -in self-signed-cert/domain.crt -export -out self-signed-cert/domain.pfx

echo -e "${GREEN}##### Self-signed certificate created #####${NC}"