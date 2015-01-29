
#
# Implements semantic date parsing from strings such as "today", "yesterday", "last week"
#
class SemanticDate
  # Define a set of parsers to handle semantic date specifications.
  parsers: [
    match: /^last ?minute$/i
    func: (now) ->
      start: new Date(now - 60000)
      end: now
  ,
    match: /^last ?hour$/i
    func: (now) ->
      start: new Date(now - 3600000)
      end: now
  ,
    match: /^(last|past) ?24(h| hours)$/i
    func: (now) ->
      start: new Date(now - 86400000)
      end: now
  ,
    match: /^yesterday$/i
    func: (now) ->
      start: new Date(new Date(now.getFullYear(), now.getMonth(), now.getDate()) - 86400000)
      end: new Date(now.getFullYear(), now.getMonth(), now.getDate())
  ,
    match: /^last ?week$/i
    func: (now) ->
      start: new Date(new Date(now.getFullYear(), now.getMonth(), now.getDate()) - now.getDay() * 86400000 - 604800000)
      end: new Date(new Date(now.getFullYear(), now.getMonth(), now.getDate()) - now.getDay() * 86400000)
  ,
    match: /^last ?month$/i
    func: (now) ->
      month = now.getMonth() - 1
      month = 11  if month < 0
      start: new Date(now.getFullYear(), month, 1)
      end: new Date(now.getFullYear(), now.getMonth(), 1)
  ,
    match: /^last ?year$/i
    func: (now) ->
      start: new Date(now.getFullYear() - 1, 0, 1)
      end: new Date(now.getFullYear(), 0, 1)
  ,
    match: /^today$/i
    func: (now) ->
      start: new Date(now.getFullYear(), now.getMonth(), now.getDate())
      end: now
  ,
    match: /^this ?week$/i
    func: (now) ->
      start: new Date(new Date(now.getFullYear(), now.getMonth(), now.getDate()) - now.getDay() * 86400000)
      end: now
  ,
    match: /^this ?month$/i
    func: (now) ->
      start: new Date(now.getFullYear(), now.getMonth(), 1)
      end: now
  ,
    match: /^this ?year$/i
    func: (now) ->
      start: new Date(now.getFullYear(), 0, 1)
      end: now
  ,
    match: /^since ?1970$/i
    func: (now) ->
      start: new Date(1970, 0, 1)
      end: now
  ]

  # Perform validation of the given semantic date string. Returns true if the string is supported, false otherwise.
  validate: (str) ->
    for p in @parsers
      return true if str.match p.match
    return false

  # Convert the given semantic date string to an object with start and end Date objects.
  convert: (str) ->
    now = new Date()
    for p in @parsers
      if str.match p.match
        return p.func(now)


#
# Exports, browser compatible
#
root = exports ? window
root.SemanticDate = new SemanticDate()
