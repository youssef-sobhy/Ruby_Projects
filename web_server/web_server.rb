require 'socket'
require 'json'

server = TCPServer.open(2000)

loop {

		socket = server.accept
		request = socket.read_nonblock(256)
		STDERR.puts request

		http_method = request.match(/GET|POST/)[0]
		path = request.match(/\w+\.\w+/)[0]
		request_headers, request_body = request.split("\r\n\r\n", 2)

		if http_method == 'GET' && File.exist?(path)
			response = File.read(path)
			socket.print "HTTP/1.0 200 OK\r\nDate: #{Time.now.ctime}\r\nContent-Type: text/html\r\nContent-Length: #{response.size}\r\n\r\n#{response}"
		elsif http_method == 'POST' && File.exist?(path)
			params = JSON.parse(request_body)
			data = "<li>name: #{params['viking']['name']}</li><li>email: #{params['viking']['email']}</li>"
			response_body = File.read(path)
			socket.print "HTTP/1.0 200 OK\r\nDate: #{Time.now.ctime}\r\nContent-Type: text/html\r\nContent-Length: #{response_body.size}\r\n\r\n"
			socket.print response_body.sub('<%= yield %>', data)
		else
			socket.print "HTTP/1.0 404 Not Found\r\n\r\n"
		end
		socket.close

}