require 'savon'

client = Savon.client(
  wsdl: 'https://www.dataaccess.com/webservicesserver/NumberConversion.wso?WSDL'
)

client.operations

response = client.call(:number_to_dollars, message: { d_num: 500 })

if response.success?
  puts response.body
else
  puts response.xml.to_s
  puts response.http_error
end
