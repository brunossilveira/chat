jQuery(document).on('turbolinks:load', function() {
  var room_id = $('#room_id').val();
  var messagesField = $('#messages');
  var usersField = $('#users');

  App.rooms = App.cable.subscriptions.create({ channel: 'RoomsChannel', room_id: room_id }, {
    connected: function() {
      console.log('test');
    },

    disconnected: function() {
    },

    received: function(data) {
      if (data.users) {
        usersField.empty();

        $.each(data.users, function(index, value) {
          usersField.append('<li>' + value + '</li>');
        });
      } else {
        messagesField.append(data['message']);
        $('#messages').scrollTop($('#messages')[0].scrollHeight);
        $.rails.enableFormElements($($.rails.formSubmitSelector));
      }
    },

    speak: function(message) {
      return this.perform('speak', { message: message, room_id: room_id });
    }
  });

  $('#new_message').submit(function(e) {
    var textarea = $(this).find('#message_body');

    if ($.trim(textarea.val()).length > 1) {
      App.rooms.speak(textarea.val());

      textarea.val('');
    }

    e.preventDefault();
  });
});
