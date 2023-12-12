import consumer from "./consumer";

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const chat = document.getElementById('chat');
    chat.insertAdjacentHTML('beforeend', `<p>${data.message}</p>`);
  },

  speak(message) {
    this.perform('speak', { message: message });
  }
});

document.addEventListener('DOMContentLoaded', () => {
  const messageForm = document.getElementById('message-form');
  const messageInput = document.getElementById('message-input');

  messageForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const message = messageInput.value;
    consumer.subscriptions.subscriptions[0].speak(message);
    messageInput.value = '';
  });
});
