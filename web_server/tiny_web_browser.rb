require 'socket'
require 'json'

puts "Would you like to send a GET request or a POST request?\n\n"
input = gets.chomp.upcase

case input
when 'GET'
	request = "GET index.html HTTP/1.0\r\n\r\n"
when 'POST'
	puts "Welcome to the viking raid registration form :D\n\n"
	puts "\nPlease enter your name:\n\n"
	name = gets.chomp.downcase
	puts "\nPlease enter your email address:\n\n"
	email = gets.chomp.downcase

	viking = {:viking => {name: name, email: email}}.to_json
	request = %{POST thanks.html HTTP/1.0\r\nFrom: #{email}\r\nUser-Agent: HTTPTool/1.0\r\nContent-Length: #{viking.size}\r\n\r\n#{viking}}
end


socket = TCPSocket.open('localhost', 2000)
socket.print(request)
response = socket.read
print response