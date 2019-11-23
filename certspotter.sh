


target="$1"
output="$2"

curl -s https://certspotter.com/api/v0/certs?domain=$target | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $target | tee -a $output
