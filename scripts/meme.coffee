# Description:
#   Get a meme from http://memecaptain.com/
#   API Docs at:
#   github.com/mmb/meme_captain_web/blob/master/doc/api/create_meme_image.md
#
# Dependencies:
#   None
#
# Commands:
#   hubot meme friday <text> - Meme: Rebecca Black - Friday
#   hubot meme Y U NO <text> - Meme: Y U NO GUY w/ bottom caption
#   hubot meme I don't always <something> but when i do <text> - Meme: The Most Interesting man in the World
#   hubot meme <text> (SUCCESS|NAILED IT) - Meme: Success kid w/ top caption
#   hubot meme <text> ALL the <things> - Meme: ALL THE THINGS
#   hubot meme <text> TOO DAMN <high> - Meme: THE RENT IS TOO DAMN HIGH guy
#   hubot meme Yo dawg <text> so <text> - Meme: Yo Dawg
#   hubot meme All your <text> are belong to <text> - Meme: All your <text> are belong to <text>
#   hubot meme If <text>, <question> <text>? - Meme: Philosoraptor
#   hubot meme <text>, BITCH PLEASE <text> - Meme: Yao Ming
#   hubot meme <text>, COURAGE <text> - Meme: Courage Wolf
#   hubot meme ONE DOES NOT SIMPLY <text> - Meme: Boromir
#   hubot meme IF YOU <text> GONNA HAVE A BAD TIME - Meme: Ski Instructor
#   hubot meme IF YOU <text> TROLLFACE <text> - Meme: Troll Face
#   hubot meme Aliens guy <text> - Meme: Aliens guy
#   hubot meme Brace yourself <text> - Meme: Ned Stark braces for <text>
#   hubot meme Iron Price <text> - Meme: To get <text>? Pay the iron price!
#   hubot meme Not sure if <something> or <something else> - Meme: Futurama Fry
#   hubot meme <text>, AND IT'S GONE - Meme: Bank Teller
#   hubot meme WHAT IF I TOLD YOU <text> - Meme: Morpheus "What if I told you"
#   hubot meme WTF <text> - Meme: Picard WTF
#   hubot meme IF <text> THAT'D BE GREAT - Meme: Generates Lumberg
#   hubot meme MUCH <text> (SO|VERY) <text> - Meme: Generates Doge
#   hubot meme <text>, <text> EVERYWHERE - Meme: Generates Buzz Lightyear
#   hubot meme khanify <text> - Meme: Has Shatner yell your phrase
#   hubot meme pun | bad joke eel <text>? <text> - Meme: Bad joke eel
#   hubot meme pun | bad joke eel <text> / <text> - Meme: Bad joke eel
# Author:
#   bobanj
#   cycomachead, Michael Ball <cycomachead@gmail.com>
#   peelman, Nick Peelman <nick@peelman.us>
#   ericjsilva, Eric Silva
#   lukewaite, Luke Waite

memeGenerator = require "./lib/memecaptain.coffee"

module.exports = (robot) ->
  robot.respond /meme friday( .+)?/i, id: 'meme.friday', (msg) ->
    friday = if msg.match[1]? then msg.match[1].trim() else 'friday'
    memeGenerator msg, '5NvNaw', "it's #{friday} #{friday}", "gotta get down on #{friday}"

  robot.respond /meme Y U NO (.+)/i, id: 'meme.y-u-no', (msg) ->
    memeGenerator msg, 'NryNmg', 'Y U NO', msg.match[1]

  robot.respond /meme aliens guy (.+)/i, id: 'meme.aliens', (msg) ->
    memeGenerator msg, 'sO-Hng', '', msg.match[1]

  robot.respond /meme iron price (.+)/i, id: 'meme.iron-price', (msg) ->
    memeGenerator msg, 'q06KuA', msg.match[1], 'Pay the iron price'

  robot.respond /meme brace yourself (.+)/i, id: 'meme.brace-yourself', (msg) ->
    memeGenerator msg, '_I74XA', 'Brace Yourself', msg.match[1]

  robot.respond /meme (.+) (ALL the .+)/i, id: 'meme.all-the-things', (msg) ->
    memeGenerator msg, 'Dv99KQ', msg.match[1], msg.match[2]

  robot.respond /meme (I DON'?T ALWAYS .*) (BUT WHEN I DO,? .*)/i, id: 'meme.interesting-man', (msg) ->
    memeGenerator msg, 'V8QnRQ', msg.match[1], msg.match[2]

  robot.respond /meme (.*)(SUCCESS|NAILED IT.*)/i, id: 'meme.success-kid', (msg) ->
    memeGenerator msg, 'AbNPRQ', msg.match[1], msg.match[2]

  robot.respond /meme (.*) (\w+\sTOO DAMN .*)/i, id: 'meme.too-damn-high', (msg) ->
    memeGenerator msg, 'RCkv6Q', msg.match[1], msg.match[2]

  robot.respond /meme (NOT SURE IF .*) (OR .*)/i, id: 'meme.not-sure-fry', (msg) ->
    memeGenerator msg, 'CsNF8w', msg.match[1], msg.match[2]

  robot.respond /meme (YO DAWG .*) (SO .*)/i, id: 'meme.yo-dawg', (msg) ->
    memeGenerator msg, 'Yqk_kg', msg.match[1], msg.match[2]

  robot.respond /meme (All your .*) (are belong to .*)/i, id: 'meme.base-are-belong', (msg) ->
    memeGenerator msg, '76CAvA', msg.match[1], msg.match[2]

  robot.respond /meme (.*)\s*BITCH PLEASE\s*(.*)/i, id: 'meme.bitch-please', (msg) ->
    memeGenerator msg, 'jo9J0Q', msg.match[1], msg.match[2]

  robot.respond /meme (.*)\s*COURAGE\s*(.*)/i, id: 'meme.courage', (msg) ->
    memeGenerator msg, 'IMQ72w', msg.match[1], msg.match[2]

  robot.respond /meme ONE DOES NOT SIMPLY (.*)/i, id: 'meme.not-simply', (msg) ->
    memeGenerator msg, 'da2i4A', 'ONE DOES NOT SIMPLY', msg.match[1]

  robot.respond /meme (IF YOU .*\s)(.* GONNA HAVE A BAD TIME)/i, id: 'meme.bad-time', (msg) ->
    memeGenerator msg, 'lfSVJw', msg.match[1], msg.match[2]

  robot.respond /meme (.*)TROLLFACE(.*)/i, id: 'meme.trollface', (msg) ->
    memeGenerator msg, 'mEK-TA', msg.match[1], msg.match[2]

  robot.respond /meme (IF .*), ((ARE|CAN|DO|DOES|HOW|IS|MAY|MIGHT|SHOULD|THEN|WHAT|WHEN|WHERE|WHICH|WHO|WHY|WILL|WON\'T|WOULD)[ \'N].*)/i, id: 'meme.philosoraptor', (msg) ->
    memeGenerator msg, '-kFVmQ', msg.match[1], msg.match[2] + (if msg.match[2].search(/\?$/)==(-1) then '?' else '')

  robot.respond /meme (.*)(A+ND IT\'S GONE.*)/i, id: 'meme.its-gone', (msg) ->
    memeGenerator msg, 'uIZe3Q', msg.match[1], msg.match[2]

  robot.respond /meme WHAT IF I TOLD YOU (.*)/i, id: 'meme.told-you', (msg) ->
    memeGenerator msg, 'fWle1w', 'WHAT IF I TOLD YOU', msg.match[1]

  robot.respond /meme (WHY THE (FUCK|FRIEND)) (.*)/i, id: 'meme.why-the-friend', (msg) ->
    memeGenerator msg, 'z8IPtw', msg.match[1], msg.match[3]

  robot.respond /meme WTF (.*)/i, id: 'meme.wtf', (msg) ->
    memeGenerator msg, 'z8IPtw', 'WTF', msg.match[1]

  robot.respond /meme (IF .*)(THAT'D BE GREAT)/i, id: 'meme.be-great', (msg) ->
    memeGenerator msg, 'q1cQXg', msg.match[1], msg.match[2]

  robot.respond /meme ((?:WOW )?(?:SUCH|MUCH) .*) ((SUCH|MUCH|SO|VERY|MANY) .*)/i, id: 'meme.doge', (msg) ->
    memeGenerator msg, 'AfO6hw', msg.match[1], msg.match[2]

  robot.respond /meme (.+, .+)(EVERYWHERE.*)/i, id: 'meme.everywhere', (msg) ->
    memeGenerator msg, 'yDcY5w', msg.match[1], msg.match[2]

  robot.respond /meme KHANIFY (.+)$/i, id: 'meme.khan', (msg) ->
    # Characters we can duplicate to make it KHAAAAAANy
    extendyChars = ['a', 'e', 'o', 'u']
    khan = ''

    # Only duplicate the first vowel (except i) we find
    extended = false

    for c in msg.match[1]
      if c in extendyChars and not extended
        khan += c for _ in [1..6]
        extended = true
      else
        khan += c

    # If there were no vowels, we need more 'oomph!'
    khan += if extended then '!' else '!!!!!'

    memeGenerator msg, 'DoLEMA', '', khan

  robot.respond /meme (?:bad joke eel|pun)(.+\?) (.+)/i, id: 'meme.bad-joke-eel', (msg) ->
    memeGenerator msg, 'R35VNw', msg.match[1], msg.match[2]

