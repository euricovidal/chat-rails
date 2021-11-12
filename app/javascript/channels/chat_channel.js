import consumer from "./consumer"
import moment from 'moment'

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('conected');
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log('disconected');
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel

    console.log('message received', data);

    const showUser = window.currentUser.id !== data.from.id;
    const userName = showUser ? `${data.from.name}:` : '';
    const time = moment(data.created_at).fromNow(true);
    const box = document.querySelector('#chat_general .card-body');
    const div = document.createElement('div');
    div.classList.add('chat-item');
    div.classList.add(`chat-${showUser ? 'left' : 'right'}`);
    div.innerHTML = `
      <div class="chat-details">
        <div class="chat-text">${data.message}</div>
        <div class="chat-time">${userName} ${time}</div>
      </div>
    `;
    box.append(div);
    box.scrollTo(0, box.scrollHeight);
  }
});
