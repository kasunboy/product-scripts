#!/bin/bash
client_request() {
    cat <<EOF
{
    "callbackUrl": "wso2.org",
    "clientName": "setup_apim_script",
    "tokenScope": "Production",
    "owner": "admin",
    "grantType": "password refresh_token",
    "saasApp": true
}
EOF
}
client_credentials=$(curl -k -u admin:admin -H "Content-Type: application/json" -d "$(client_request)" https://localhost:9443/client-registration/v0.14/register| jq -r '.clientId + ":" + .clientSecret')
#echo $client_credentials
get_access_token() {
    local access_token=$(curl -k -d "grant_type=password&username=admin&password=admin&scope=apim:api_view apim:api_publish apim:api_create apim:subscribe" -u $client_credentials https://localhost:8243/token | jq -r '.access_token')
    echo $access_token
}

access_token=$(get_access_token)
echo $access_token