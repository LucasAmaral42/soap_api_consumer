require 'savon'

client = Savon.client(
  wsdl:                    'https://www.dataaccess.com/webservicesserver/NumberConversion.wso?WSDL',
  log:                     false,
  wsse_auth:               nil, #[ENV['username'], ENV['password']],
  pretty_print_xml:        false,
  convert_request_keys_to: :none
)

client.operations

response = client.call(:number_to_words, message: { ubiNum: 500 })

if response.success?
  puts response.body
else
  puts response.xml.to_s
  puts response.http_error
end
