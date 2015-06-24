#
# Unit tests for semantic-date.coffee
#
describe "Semantic Date Parser", ->

  beforeEach ->
    @sd = require '../'

  it "should validate supported semantic date strings", ->
    # check canonical forms of each date range for match
    expect(@sd.validate("last minute")).toBe true
    expect(@sd.validate("last hour")).toBe true
    expect(@sd.validate("past hour")).toBe true
    expect(@sd.validate("last 24 hours")).toBe true
    expect(@sd.validate("last 24h")).toBe true
    expect(@sd.validate("yesterday")).toBe true
    expect(@sd.validate("last week")).toBe true
    expect(@sd.validate("last month")).toBe true
    expect(@sd.validate("last year")).toBe true
    expect(@sd.validate("today")).toBe true
    expect(@sd.validate("this week")).toBe true
    expect(@sd.validate("this month")).toBe true
    expect(@sd.validate("this year")).toBe true
    expect(@sd.validate("since 1970")).toBe true

    # check other forms of a few date ranges
    expect(@sd.validate("lastHour")).toBe true
    expect(@sd.validate("thisWeek")).toBe true
    expect(@sd.validate("YESTERDAY")).toBe true

  it "should correctly calculate a range with given datum", ->
    expect(JSON.stringify(@sd.convert("last hour", new Date(2011, 3, 4, 3, 0, 0)))).toBe '{"start":"2011-04-04T06:00:00.000Z","end":"2011-04-04T07:00:00.000Z"}'
