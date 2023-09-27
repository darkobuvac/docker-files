#! /bin/bash

openssl verify -CAfile certs/ca.cert.pem intermediate/certs/intermediate.cert.pem

openssl verify -partial_chain -CAfile intermediate/certs/intermediate.cert.pem intermediate/certs/server.cert.pem

echo -e "${GREEN}##### Verified certificates #####${NC}"