timecodeutils
=============

Convert timecode(hh:mm:ss) to seconds and vice versa

usage
=====

timecodeutils = require("timecodeutils")

console.log timecodeutils.secondsToTC(61)			# gives "00:01:01"
console.log timecodeutils.TCToSeconds("00:01:01")	# gives 61