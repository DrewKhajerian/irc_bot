require "twitter"
require "rubygems"
require "socket"

Twitter.configure do |config|
  config.consumer_key = 'JYeHTrfiewwLk2SjTUt4lg'
  config.consumer_secret = '5YTiiPeVPbc39EE3A7wr64fCGJG9Vvszwh4NTzu14'
end

@channel = "#bitmakerlobs"
@greeting_prefix = "PRIVMSG #bitmakerlobs :"

def connect_to_server
  server = "chat.freenode.net"
  port = "6667"
  nick = "TwitBot2302"
  irc_server = TCPSocket.open(server, port)
  irc_server.puts "USER btwitbot 0 * BTwitBot"
  irc_server.puts "NICK #{nick}"
  irc_server.puts "JOIN #{@channel}"
  irc_server
end

def send_message(msg) #sends a message in the current channel
  @irc_server.puts "PRIVMSG #{@channel} :#{msg}"
end

def channel_message?(msg) #Only communicates with peope in the current channel
  msg.include?(@greeting_prefix)
end

def extract_input(msg)
	array = msg.chomp.split(":")
	array[-1]
end

def tweet_finder
# puts "Search by tweeter(1) or hashtag (2)?"
# puts Twitter.user_timeline("blirctwitbot").first.text
# puts Twitter.user("blirctwitbot").to_s
# if msg

# print "What #hashtag do you wanna search: \n#"
# hashtag = gets.chomp
# puts "How many results do you want?"
# twit_results = gets.chomp
# Prints which user: tweet text containg phrase or keyword or #hashtag
# Twitter.search("#"+hashtag, :count => 5, :result_type =>"recent").results.map do|status|
# 	puts "@#{status.from_user}: #{status.text}"
# end

end

# Establish a connection and join the #bitmakerlob channel
@irc_server = connect_to_server
# Introduce itself to channel
send_message("TwitBot!")

def tweet_finder
# send_message(Twitter.user_timeline("blirctwitbot").first.text.to_s)
end

# tweets = Twitter.search("to:justinbieber marry me", :count => 5, :result_type => "recent").results.map do |status|
#   "#{status.from_user}: #{status.text}"
# end

def print_tweet(tweets)
	tweets.each do |tweet|
		send_message(tweet)
	end
end

until @irc_server.eof? do
  msg = @irc_server.gets
  puts msg

  next unless channel_message?(msg)
  input = extract_input(msg)
  puts "!!! INPUT ENCOUNTERED !!!: #{input}"


  # Return results of hashtag search
  tweet_results = Twitter.search("#"+input, :count => 5, :result_type =>"recent").results.map do|status|
		"@#{status.from_user}: #{status.text}"
	end

	print_tweet(tweet_results)



end
