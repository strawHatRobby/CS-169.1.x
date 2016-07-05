require 'sinatra'

class MyApp < Sinatra::Base
    get '/' do
    	"<!DOCTYPE html>
<html>
<head>
	<title>firstApp</title>
</head>
<body>
    Hello and Alvida
</body>
</html>"
	end
end
