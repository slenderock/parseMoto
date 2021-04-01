# require 'net/http'
# require './consts'
# require './auto_ria'
# require './olx'

# url = URLS[0]

# response = Net::HTTP.get url

# if url.include?(SITES[:auto_ria])
#   command_class = AutoRia
# end

# if url.include?(SITES[:olx])
#   command_class = Olx
# end

# command = command_class.new(response)
# p command.download
