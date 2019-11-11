print "Server node \n"

require "socket"

server = TCPServer.open("localhost", 2000)
messages = []
connections = []

loop do

  Thread.new(server.accept) do |conn|
    connections.push(conn)

    conn.puts "Dados de teste"

    resposta = conn.gets.chomp
    messages.push(resposta)

    if messages.length == 3
      if messages.uniq.size <= 1 && messages[0] === "C"
        connections.each {|c| c.puts "commit"}
        messages = []
        connections = []
      else
        connections.each {|c| c.puts "abort"}
        messages = []
        connections = []
      end
    end
  end

end