# Description
#   Split up long messages
#
# Configuration:
#   HUBOT_CHUNKIFY_MAX - Maximum length of a chunk
#
# Commands:
#   None
#
# Author:
#   chen-ye

maxLength = process.env.HUBOT_CHUNKIFY_MAX or 320

module.exports = (robot) ->
        
    _chunkify = (string, newstrings) ->
        if(string.length > maxLength)
          while string.length > 0
            # Split message at last line break, if it exists
            chunk = string.substring(0, maxLength)
            breakIndex = if chunk.lastIndexOf('\n') isnt -1 then chunk.lastIndexOf('\n') else maxLength
            newstrings.push string.substring(0, breakIndex)
            # Skip char if split on line break
            breakIndex++ if breakIndex isnt maxLength
            string = string.substring(breakIndex, string.length)
        else 
          newstrings.push(string)

    robot.responseMiddleware (context, next, done) ->
        return unless context.plaintext?

        strings = context.strings
        
        newstrings = []
        
        _chunkify string, newstrings for string in strings
            
        context.strings = newstrings
        
        next()
