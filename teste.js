const WebSocket = require('ws');

function onError(ws, err) {
  console.log(`onError: ${err.message}`);
}

function onMessage(ws, data) {
  console.log(`onMessage: ${data}`);
}

const ws = new WebSocket('ws://localhost:3000/cable?user_id=1')

ws.on('open', function onConnection() {
  console.log('open');

  const identifier = '{"channel":"ChatChannel"}';
  ws.send(JSON.stringify({"command":"subscribe","identifier":identifier}));

  ws.on('message', data => onMessage(ws, data));
  ws.on('error', error => onError(ws, error));
})

console.log('rodando...');
