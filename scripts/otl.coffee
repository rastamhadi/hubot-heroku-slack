# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

ROOM = "#livingroom"
TIMEZONE = "Asia/Tokyo"
REPORT_TIME = "0 0 19 * * 1-5"

cronJob = require('cron').CronJob

addResponse = (res, emoji) ->
  channel = res.message.rawMessage.channel
  ts      = res.message.id

  res
    .http("https://slack.com/api/reactions.add")
    .query
      token: process.env.HUBOT_SLACK_TOKEN,
      name: emoji
      channel: channel,
      timestamp: ts
    .get() (err, resp, body) ->
      if err?
        return

module.exports = (robot) ->
  digitize = (num) ->
    digits = [
      "zero"
      "one"
      "two"
      "three"
      "four"
      "five"
      "six"
      "seven"
      "eight"
      "nine"
    ]

    nums = num.toString()
    chars = nums.split("")
    str = ""
    for char in chars
      str += ":#{digits[parseInt(char)]}: "

    str

  robot.hear /(wtf|what the fuck|what the hell|what the heck|what the [^ ]+ fuck)/i, (res) ->

    wtfs = robot.brain.get("wtfs") * 1 or 0
    wtfs = wtfs + 1
    robot.brain.set("wtfs", wtfs)

    res.send("#{digitize(wtfs)} W.T.F.")

  robot.hear /\bOTL\b/i, (res) ->

    otls = robot.brain.get("otls") * 1 or 0
    otls = otls + 1
    robot.brain.set("otls", otls)

    res.send("#{digitize(otls)} O.T.L.")

  wtfreport = new cronJob(REPORT_TIME, ->
                wtfs = robot.brain.get("wtfs") * 1 or 0
                otls = robot.brain.get("otls") * 1 or 0
                robot.messageRoom ROOM, "Today's W.T.F.s: #{digitize(wtfs)}, Today's O.T.L.s: #{digitize(otls)}"
                robot.messageRoom ROOM, "Rastam, go home."
                robot.brain.set("wtfs", 0)
                robot.brain.set("otls", 0)
              null,
              true,
              TIMEZONE)
