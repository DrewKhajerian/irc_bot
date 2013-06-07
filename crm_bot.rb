require "socket"
require "database"

@channel = "#bitmakerlobs"
@greeting_prefix = "privmsg #bitmakerlobs :"
@crm_prefix = "crm"

def connect_to_server
  server = "chat.freenode.net"
  port = "6667"
  nick = "CRMBot"
  irc_server = TCPSocket.open(server, port)
  irc_server.puts "USER CRMBot 0 * CRMBot"
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

def crm?(msg) #
  msg.include? @crm_prefix
end

def output_command_prompt
	send_message "Enter your choice: "
	send_message "To add a contact, type 1" 
	send_message "To display all contacts, type 2"
	send_message "To modify a contact, type 3" 
	send_message "To display by attribute, type 4" 
	send_message "To display by contact, type 5" 
	send_message "To delete contact, type 6"
	send_message "To exit, type 0"
end



