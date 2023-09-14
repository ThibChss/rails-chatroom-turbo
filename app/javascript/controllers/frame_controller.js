import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="frame"
export default class extends Controller {

  static targets = [
    'notifications',
    'frameChatroom'
  ]

  static values = {
    chatrooms: Array
  }

  connect() {
  }

  notificationsToggle() {
    const srcID                   = Number.parseInt(this.frameChatroomTarget.src.match(/\d*$/)[0])
    const activeChatroom          = this.chatroomsValue.find(chatroom => chatroom.id === srcID)
    const chatroomNotification    = this.notificationsTargets.find(notification => Number.parseInt(notification.dataset.id) === srcID)

    console.log('Source ID: ', srcID);
    console.log('Active chatroom: ', activeChatroom);
    console.log('Notification: ', chatroomNotification);

    if (activeChatroom && chatroomNotification) {
      if (activeChatroom.id === srcID) chatroomNotification.hidden = true

      this.notificationsTargets.forEach(notification => {
        if ((Number.parseInt(notification.dataset.id) !== srcID)) {
          notification.hidden = false
        }
      })
    }
  }
}
