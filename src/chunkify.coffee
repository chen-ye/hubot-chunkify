# Description
#   Split up long messages
#
# Configuration:
#   HUBOT_CHUNKIFY_MAX
#
# Commands:
#   None
#
# Author:
#   chen-ye

HUBOT_CHUNKIFY_MAX = process.env.HUBOT_CHUNKIFY_MAX or 320
chunkExp = new RegExp('.{1,' + HUBOT_CHUNKIFY_MAX + '}', 'g')

module.exports = (robot) ->

    _chunkify = (string, newstrings) ->
        if string.length > HUBOT_CHUNKIFY_MAX
            chunks = string.match(chunkExp)
            newstrings.push string for string in chunks
        else newstrings.push string

    robot.responseMiddleware (context, next, done) ->
        return unless context.plaintext?

        strings = context.strings
        
        newstrings = []
        
        _chunkify string, newstrings for string in strings
            
        context.strings = newstrings
        
        next()