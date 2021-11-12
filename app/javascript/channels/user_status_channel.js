import consumer from "./consumer"

consumer.subscriptions.create("UserStatusChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log(data)

    if(!window.currentUser || !data.user || window.currentUser.id === data.user.id) return;

    const box = document.querySelector('#users_list');
    let userBox = box.querySelector(`[data-id="${data.user.id}"]`);

    if(userBox) {
      const userStatus = userBox.querySelector('.user-status');
      if(data.status === 'online') {
        userStatus.classList.add('text-success');
      } else {
        userStatus.classList.remove('text-success');
      }
      const capitalizeStatus = data.status.replace(/^\w/, function(c) { return c.toUpperCase() });
      userStatus.innerHTML = `<i class="fas fa-circle"></i> ${capitalizeStatus}`;
      userBox.querySelector('small').textContent = '(less than a minute)';
    } else {
      const userBox = document.createElement('li');
      userBox.classList.add('media');
      userBox.dataset.id = data.user.id

      userBox.innerHTML = `
        <div class="media-body">
          <div class="mt-0 mb-1 font-weight-bold">${data.user.name}</div>
            <div class="text-success text-small font-600-bold user-status">
              <i class="fas fa-circle"></i> Online
            </div>
            <div class="mt-0 mb-1"><small>(less than a minute)</small></div>
        </div>
      `;

      box.prepend(userBox);
    }
  }
});
