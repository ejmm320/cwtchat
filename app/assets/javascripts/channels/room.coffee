App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append "<div class=\"list-group-item\">
                              <div class=\"d-flex w-100 justify-content-between\">
                                <h5>"+data['user']+"</h5>
                                <small>"+data['created_at']+"</small>
                              </div>
                              <div><p>"+data['message']+"</p></div>
                          </div>"
    # Called when there's incoming data on the websocket for this channel