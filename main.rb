require 'net/http'
require 'csv'
require './consts'
require './auto_ria'
require './olx'

CSV.open(
  "reports.csv", "w", 
  write_headers: true, 
  headers: RESPONSE_INTERFACE.keys
) do |csv|
  URLS.each do |url|    
    uri = URI url
    response = Net::HTTP.get uri

    if url.include?(SITES[:auto_ria])
      command_class = AutoRia
    end

    if url.include?(SITES[:olx])
      command_class = Olx
    end

    command = command_class.new(response, url)
    result = command.download

    csv << result.values
  end
end