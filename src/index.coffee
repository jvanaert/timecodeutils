class TimecodeUtils
	@_pad = (i) ->
		if i < 10
			return "0#{i}"
		else
			return i

	@secondsToTC = (seconds) ->
		return undefined unless seconds?
		return undefined if seconds is ""

		if seconds >= 0
			hours = @_pad( parseInt((seconds/(60*60)), 10))
			seconds -= (hours * 60 * 60)
			mins = @_pad( parseInt((seconds / 60), 10))
			secs = @_pad( parseInt((seconds % 60), 10))
			"#{hours}:#{mins}:#{secs}"
		else
			undefined

	@TCToSeconds= (tc) ->
		tcregex =  /^(?:(?:([01]?\d|2[0-3]):)?([0-5]?\d):)?([0-5]?\d)$/
		return undefined unless typeof(tc) is "string"
		matches = tc.match(tcregex)
		if matches?
			hours = parseInt(matches[1], 10)
			mins = parseInt(matches[2], 10)
			secs = parseInt(matches[3], 10)
			(hours * 60 * 60) + (mins * 60) + secs
		else
			undefined

module.exports = TimecodeUtils