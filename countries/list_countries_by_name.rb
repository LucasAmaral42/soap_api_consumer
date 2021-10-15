require 'savon'

client = Savon.client(
  wsdl:                    'http://webservices.oorsprong.org/websamples.countryinfo/CountryInfoService.wso?WSDL',
  log:                     false,
  wsse_auth:               nil, #[ENV['username'], ENV['password']],
  pretty_print_xml:        false,
  convert_request_keys_to: :none
)

response = client.call(:list_of_country_names_by_name)

if response.success?
  puts response.body
else
  puts response.xml.to_s
  puts response.http_error
end
