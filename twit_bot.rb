require "twitter"
require "rubygems"
# require "socket"

Twitter.configure do |config|
  config.consumer_key = 'JYeHTrfiewwLk2SjTUt4lg'
  config.consumer_secret = '5YTiiPeVPbc39EE3A7wr64fCGJG9Vvszwh4NTzu14'
end



# puts Twitter.user_timeline("blirctwitbot").first.text
puts Twitter.user("blirctwitbot").to_s

# print "What #hashtag do you wanna search: \n#"
# hashtag = gets.chomp
# puts "How many results do you want?"
# twit_results = gets.chomp
# # Prints which user: tweet text containg phrase or keyword or #hashtag
# Twitter.search("#"+hashtag, :count => twit_results, :result_type =>"recent").results.map do|status|
# 	puts "@#{status.from_user}: #{status.text}"
# end

# @channel = "#bitmakerlobs"
# @greeting_prefix = "PRIVMSG #bitmakerlobs :"
# @twit_prefix = "twitter"

# def connect_to_server
#   server = "chat.freenode.net"
#   port = "8001"
#   nick = "TwitBot"
#   irc_server = TCPSocket.open(server, port)
#   irc_server.puts "USER btwitbot 0 * BTwitBot"
#   irc_server.puts "NICK #{nick}"
#   irc_server.puts "JOIN #{@channel}"
#   irc_server
# end

# def send_message(msg) #sends a message in the current channel
#   @irc_server.puts "PRIVMSG #{@channel} :#{msg}"
# end

# def channel_message?(msg) #Only communicates with peope in the current channel
#   msg.include?(@twit_prefix)
# end

# def crm?(msg) #
#   msg.include? @twit_prefix
# end