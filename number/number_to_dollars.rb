require 'savon'

client = Savon.client(
  wsdl:                    'https://www.dataaccess.com/webservicesserver/NumberConversion.wso?WSDL',
  log:                     false,
  wsse_auth:               nil, #[ENV['username'], ENV['password']],
  pretty_print_xml:        false,
  convert_request_keys_to: :none
)

response = client.call(:number_to_dollars, message: { dNum: 500 })

if response.success?
  puts response.body
else
  puts response.xml.to_s
  puts response.http_error
end
