defmodule HttpClient do

	def send_request(request) do
		
	    SomeHostInNet = 'localhost:4568/' # to make it runnable on one machine
	    {:ok, Sock} = :gen_tcp.connect(SomeHostInNet, 4567 
	                                 [:binary packet: :raw, active: false])
	    :ok = :gen_tcp.send(Sock, request)
	    {:ok, response} = :gen_tcp.recv(socket, 0)
	    :ok = :gen_tcp.close(Sock)

	    response
	end
	
end
request = """
GET / HTTP/1.1\r
Host: linke-wedel.de\r
User-Agent: Undefiend/1.0\r
Accept: */*\r
\r
"""

response = HttpClient.send_request(request)
IO.puts response