#!/bin/bash
access_token=$(sh access-token.sh)
echo "\nAccess token : " $access_token "\n"

################################get API PRODUCT ############################
product_id=$(cat id.productid)
echo "Product Id : " $product_id
echo "\n"curl -k -H \"Content-Type: application/json\" -X GET https://localhost:9443/api/am/store/v1.0/api-products/$product_id "\n"
payload=$(curl -k -X GET https://localhost:9443/api/am/store/v1.0/api-products/$product_id)

echo "\n\nAPI Product: \n\n" $payload "\n\n"