require 'websocket-eventmachine-client'

EM.run do
  ws = WebSocket::EventMachine::Client.connect(uri: 'ws://localhost:3000/cable?user_id=1')

  ws.onopen do
    ws.send '{"command":"subscribe","identifier":"{\"channel\":\"ChatChannel\"}"}'
    puts "connected"
  end

  ws.onmessage do |message, type|
    puts "recebeu #{message}, #{type}"
  end

  ws.onclose do |code, reason|
    puts "saiu, code: #{code}, reason: #{reason}"
  end
end
