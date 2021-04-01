require 'net/http'
require './consts'
require './auto_ria'
require './olx'

URLS.each do |url|
# url = URLS.first
  uri = URI url
  response = Net::HTTP.get uri

  if url.include?(SITES[:auto_ria])
    command_class = AutoRia
  end

  if url.include?(SITES[:olx])
    command_class = Olx
  end

  command = command_class.new(response)
  p command.download
end
