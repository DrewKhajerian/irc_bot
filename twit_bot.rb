require "twitter"
require "rubygems"
require "socket"

Twitter.configure do |config|
  config.consumer_key = 'JYeHTrfiewwLk2SjTUt4lg'
  config.consumer_secret = '5YTiiPeVPbc39EE3A7wr64fCGJG9Vvszwh4NTzu14'
end

class InvalidUserException < Exception 
    # empty because it inherents from Exception class
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

#sends a message in the current channel
def send_message(msg) 
  @irc_server.puts "PRIVMSG #{@channel} :#{msg}"
end

#Only communicates with peope in the current channel
def channel_message?(msg) 
  msg.include?(@greeting_prefix)
end

# Gets the correct #hashtag or @user by removing the server messages with split
# and returns the last string in the array (#hash or @username)
def extract_input(msg)
	array = msg.chomp.split(":")
	array[-1]
end

# Determines if the user wants to display #hashtag search results or a specific
# users last tweet
def tweet_finder(input)
	# raise InvalidGuessException.new("Invalid user!") if input == "Twitter::Error::NotFound"
	if input[0] == "@"
		tweet_results = Twitter.user_timeline(input).first.text
		print_user_tweet(input+": "+tweet_results)
	else
  	tweet_results = Twitter.search("#"+input, :count => 5, :result_type =>"recent").results.map do|status|
			"@#{status.from_user}: #{status.text}"
		end
		print_tweet(tweet_results)
	end
	send_message("Enter a #hashtag or @twitter user")
end

# def invalid_user?(input)
# 	if input == "alid_guess?"
# end

# Establish a connection and join the #bitmakerlob channel
@irc_server = connect_to_server

# Introduce itself to channel
send_message("TwitBot!")

# prints tweets on new lines by iterating through the tweet array (for hashtags only)
def print_tweet(tweets)
	tweets.each do |tweet|
		send_message(tweet)
	end
end

# prints specific users last tweet
def print_user_tweet(tweet)
	send_message(tweet)
end

#first message after twitbots introduction
send_message("Enter a #hashtag or @twitter user")

# infinite loop
until @irc_server.eof? do
  msg = @irc_server.gets
  puts msg

  # ensures it's only grabbing input from specified channel
  next unless channel_message?(msg)
  input = extract_input(msg)
  puts "!!! INPUT ENCOUNTERED !!!: #{input}"

	# begin
 #    if input == "Twitter::Error::NotFound"
 #    	 send_message("Invalid user!")
 #    end
 #  rescue InvalidInputException.new => e
 #    	send_message(e.message)
 #  end

  # calls tweet_finder method
  tweet_finder(input)
end
