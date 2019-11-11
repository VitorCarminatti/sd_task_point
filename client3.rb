print "Client node 3 \n"

require "socket"

loop do
  socket = TCPSocket.open("localhost", 2000)
  
  message = socket.gets.chomp
  p "Mensagem recebida, deseja commitar ou abortar? (C/A)"

  action = gets.chomp
  socket.puts action

  p "Comando enviado para o servidor"

  decisao = socket.gets.chomp

  if decisao == "commit"
    p "Commitado"
  else
    p "Abortado"
  end
end