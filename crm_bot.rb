require "socket"
require_relative "database"

@channel = "#bitmakerlobs"
@greeting_prefix = "PRIVMSG #bitmakerlobs :"
@crm_prefix = "crm"

def connect_to_server
  server = "chat.freenode.net"
  port = "6667"
  nick = "CRMBot"
  irc_server = TCPSocket.open(server, port)
  irc_server.puts "USER bcrmbot 0 * BCRMBot"
  irc_server.puts "NICK #{nick}"
  irc_server.puts "JOIN #{@channel}"
  irc_server
end

def send_message(msg) #sends a message in the current channel
  @irc_server.puts "PRIVMSG #{@channel} :#{msg}"
end

def channel_message?(msg) #Only communicates with people in the current channel
  msg.include?(@greeting_prefix)
end


def output_command_prompt
	send_message "Enter your choice: "
	send_message "To add a contact, type 1" 
	send_message "To display all contacts, type 2"
	# send_message "To modify a contact, type 3" 
	# send_message "To display by attribute, type 4" 
	# send_message "To display by contact, type 5" 
	# send_message "To delete contact, type 6"
	# send_message "To exit, type 0"
end

def extract_input(msg)
  msg.chomp
end
 
# Establish a connection and join the #bitmakerlob channel
@irc_server = connect_to_server
@database = Database.new
# Introduce itself to channel
send_message("Manage your customers with our CRMBot!.") 
output_command_prompt

until @irc_server.eof? do
  msg = @irc_server.gets
  puts msg

  input = extract_input(msg)
  
 	case input
			when "1"
				@database.add_contact
			when "2"
				@database.display_all_contacts
			when "3"
				@database.modify_contact
			when "4"
				@database.display_by_attribute
			when "5"
				@database.display_particular_contact
			when "6"
				@database.delete_contact
			end
		
			if msg == "0"
				break
			end
 
			# output_command_prompt

end




