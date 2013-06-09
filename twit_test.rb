require "twitter"
require "rubygems"

Twitter.configure do |config|
  config.consumer_key = 'JYeHTrfiewwLk2SjTUt4lg'
  config.consumer_secret = '5YTiiPeVPbc39EE3A7wr64fCGJG9Vvszwh4NTzu14'
end

 tweet_results = Twitter.search("#"+"batman", :count => 5, :result_type =>"recent").results.map do|status|
		"##{status.from_user}: #{status.text}"
	end

	# send_message(tweet_results)


	tweet_results.each do |tweet|
		puts tweet
	end