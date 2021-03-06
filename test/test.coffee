assert = require('chai').assert
timecodeutils = require "../src/index"

describe "Check interface", ->
	it "should implement TCToSeconds", ->
		assert.isFunction timecodeutils.TCToSeconds

	it "should implement secondsToTC", ->
		assert.isFunction timecodeutils.secondsToTC

	it "should implement _pad", ->
		assert.isFunction timecodeutils._pad

describe "convert seconds to timecode", ->
	it "should handle valid cases", ->
		assert.equal timecodeutils.secondsToTC(0), "00:00:00"
		assert.equal timecodeutils.secondsToTC(1), "00:00:01"
		assert.equal timecodeutils.secondsToTC(60), "00:01:00"
		assert.equal timecodeutils.secondsToTC(60 * 60), "01:00:00"

	it "should handle string parameter", ->
		assert.equal timecodeutils.secondsToTC("10"), "00:00:10"

	it "should handle invalid cases", ->
		assert.equal timecodeutils.secondsToTC(-1), undefined
		assert.equal timecodeutils.secondsToTC(undefined), undefined
		assert.equal timecodeutils.secondsToTC(null), undefined
		assert.equal timecodeutils.secondsToTC("a"), undefined
		assert.equal timecodeutils.secondsToTC(""), undefined

describe "convert timecode to seconds", ->
	it "should handle valid cases", ->
		assert.equal 0, timecodeutils.TCToSeconds("00:00:00")
		assert.equal 1, timecodeutils.TCToSeconds("00:00:01")
		assert.equal 60, timecodeutils.TCToSeconds("00:01:00")
		assert.equal 60*60, timecodeutils.TCToSeconds("01:00:00")
	it "should handle invalid cases", ->
		assert.equal undefined, timecodeutils.TCToSeconds(-1)
		assert.equal undefined, timecodeutils.TCToSeconds("-1")
		assert.equal undefined, timecodeutils.TCToSeconds("a")
		assert.equal undefined, timecodeutils.TCToSeconds("99:99:99")
		assert.equal undefined, timecodeutils.TCToSeconds("00:99:99")
		assert.equal undefined, timecodeutils.TCToSeconds("00:00:99")

describe "pad method", ->
	it "should prepend 0 if number <= 9", ->
		for i in [0..9]
			assert.equal "0#{i}", timecodeutils._pad(i)
			assert.equal "0#{i}", timecodeutils._pad("#{i}")
	
	it "should not prepend 0 if number > 9", ->
		for i in [10..99]
			assert.equal "#{i}", timecodeutils._pad(i)
			assert.equal "#{i}", timecodeutils._pad("#{i}")
		
