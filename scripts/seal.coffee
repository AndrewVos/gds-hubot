module.exports = (robot) ->
  robot.hear /seal me up/i, (res) ->
    room = msg.message.room
    robot.http("https://moody-seal.herokuapp.com/teams/#{room}")
      .post(room) (err, res, body) ->
        if res.statusCode isnt 200
        res.send "Request didn't come back HTTP 200 :("
        return
        res.send "Seal report request sent to #{room}"
