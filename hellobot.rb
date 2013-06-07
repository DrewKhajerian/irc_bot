require "socket"

server = "chat.freenode.net"
port = "6667"
nick = "PootieBot"
channel = "#bitmakerlobs"
greeting_prefix = "PRIVMSG #bitmakerlobs :"
greetings = ["hello", "hi", "hola", "yo", "wazup", "guten tag", "howdy", "salutations", "who the hell are you?"]
POOTIE = ["you're a baddy daddy lamatai tebby chai!","Sepatown!","Sa da tay!","Ain't come one, but many tine tanies!","Kappa-chow!","I gots to say na nay no","Cole me on the panny sty",]

s = TCPSocket.open(server, port)
# print("addr: ", s.addr.join(":"), "\n")
# print("peer: ", s.peeraddr.join(":"), "\n")
s.puts "USER testing 0 * Testing"
s.puts "NICK #{nick}"
s.puts "JOIN #{channel}"
s.puts "PRIVMSG #{channel} :Hello from IRB Bot"


until s.eof? do
  msg = s.gets
  puts msg

 wasGreeted = false
  greetings.each do |greeting|
    if msg.include? greeting
      wasGreeted = true 
      puts "The greeting was recognized."
    end
  end

  if msg.include? greeting_prefix and wasGreeted
    puts "About to send out a message!"
    response = POOTIE.sample
    s.puts "PRIVMSG #{channel} :#{response}"
  end

end




