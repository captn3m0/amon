$(document).ready ->
  SLACK_BASE_URL = $('.slack_base_url').attr('href')
  $.getJSON SLACK_BASE_URL+'/users/json', (original_users)->
    users = {}
    for x in original_users
      users[x.id] = x
    $('.user').each (index, user) ->
      $user = $ user
      if users[$user.text()]
        $user.text users[$user.text()].name
    $('.message').each (index, message) ->
      $message = $ message
      $message.text $message.text().replace /<@(U\w*)[\|]?(\w*)?>/i, (match, id, nick)->
        if nick
          return "@" + nick
        else if users[id]
          return "@" + users[id].name
        else
          return "@" + id.slice(1).toLowerCase()