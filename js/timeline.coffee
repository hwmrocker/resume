---
---
months = ["",
  "Januar",
  "Februar",
  "März",
  "April",
  "Mai",
  "Juni",
  "Juli",
  "August",
  "September",
  "Oktober",
  "November",
  "Dezember"
]

parseDate = (datestring) ->
  # could be Just a Year "2012", or Month Year "Januar 2013", or "jetzt"
  if datestring == "jetzt"
    return new Date()
  day = "01"
  if " " not in datestring
    month = "01"
    year = datestring
  else
    tmp = datestring.split(" ")
    month = "0" + months.indexOf(tmp[0])
    month = month[-2..]
    year = tmp[1]
  d = new Date([year,month,day].join("-"))

getTimeSpan = (timespanstring) ->
  # eg. "Januar 2012 - Oktober 2013"
  (parseDate d for d in timespanstring.split(" - "))

ruby2json = (rubystring) ->
  tmp = rubystring.replace /}{/g, "},{"
  tmp = tmp.replace /[=]>/g, ": "
  JSON.parse(tmp)

getTimeFromEdu = (edupart) ->
  tmp = getTimeSpan edupart.timeframe
  {
    "starting_time": Date.parse tmp[0]
    "ending_time": Date.parse tmp[1]
    # "label": edupart.what
  }

window.generateTimeline = (exp, edu) ->
  education = ruby2json edu
  experience = ruby2json exp
  chartData = [
    {
      label: "Ausbildung"
      times: (getTimeFromEdu edupart for edupart in education)
    }
    {
      label: "Erfahrung"
      times: (getTimeFromEdu expart for expart in experience)
    }
  ]
  # alert JSON.stringify chartData
  chart = d3.timeline().width(800).stack(true).tickFormat(
    format: d3.time.format("%Y")
    tickTime: d3.time.years
    tickInterval: 5
    tickSize: 2
  ).click fooclick
  svg = d3.select("#timeline1").append("svg").attr("width", 800).datum(chartData).call(chart)


$(document).ready ->
  # alert "foo"
  $("#timeline1").sticky({topSpacing:0})
