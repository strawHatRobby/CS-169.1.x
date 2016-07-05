require 'sinatra'

class MyApp < Sinatra::Base
    get '/' do
    	"<!DOCTYPE html>
<html>
<head>
	<title>firstApp</title>
</head>
<body>
    Hello Rob
</body>
</html>"
	end
end
