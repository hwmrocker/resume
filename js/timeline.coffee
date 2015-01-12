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

getTimeFromExp = (expart) ->
  tmp = getTimeSpan expart.timeframe
  end_date = new Date(tmp[1].getFullYear(), tmp[1].getMonth() + 1, 0)
  {
    "starting_time": Date.parse tmp[0]
    "ending_time": Date.parse end_date
    "id": expart.uid
  }

clear_select = () ->
  $('ul.resume-list li').removeClass("select")
  $(".timeline_element").each ()->
    $(this).attr("class", (w for w in $(this).attr("class").split(" ") when w isnt "select").join(" ") )

select = (id) ->
  $('#frame_' + id).addClass("select")
  timeline_item = $('#timelineItem_' + id)
  timeline_item.attr("class", timeline_item.attr("class") + " select")


fooclick = (d, idx, datum) ->
  if d.id in ["ehsa", "egsa"]
    return
  element = $('#frame_' + d.id)
  timeline_element = $('#timelineItem_' + d.id)
  clear_select()
  select(d.id)

  window_height = $(window).height()
  scroll_top = $(window).scrollTop()
  timeline_height = $("#timeline1").height()
  viewport_h = window_height - timeline_height

  element_scroll_top = element.offset().top
  element_height = element.height()

  scroll_to_top_position = element_scroll_top - timeline_height
  scroll_to_bottom_position = element_scroll_top - window_height + element_height + 20
  if scroll_to_top_position  >= scroll_top and scroll_to_bottom_position <= scroll_top
    # element is completly visible, we do not need to scroll
    return

  top_scroll_distance = Math.abs(scroll_top - scroll_to_top_position)
  bottom_scroll_distance = Math.abs(scroll_top - scroll_to_bottom_position)

  if top_scroll_distance < bottom_scroll_distance
    $("body, html").animate({scrollTop: (scroll_to_top_position)}, 250)
  else
    $("body, html").animate({scrollTop: (scroll_to_bottom_position)}, 250)

fooin = () ->
  $t = $(this)
  [_, id] = $t.attr("id").split("_")
  clear_select()
  select(id)

fooout = () ->
  clear_select()

window.generateTimeline = (exp, edu) ->
  education = ruby2json edu
  experience = ruby2json exp

  chartData = [
    {
      label: "Ausbildung"
      times: (getTimeFromExp edupart for edupart in education)
    }
    {
      label: "Erfahrung"
      times: (getTimeFromExp expart for expart in experience)
    }
  ]
  chart = d3.timeline().width(800).stack(true).tickFormat(
    format: d3.time.format("%Y")
    tickTime: d3.time.years
    tickInterval: 5
    tickSize: 2
  ).click fooclick
  svg = d3.select("#timeline1").append("svg").attr("width", 800).datum(chartData).call(chart)


$(document).ready ->
  $("#timeline1").sticky({topSpacing:0})
  $(".resume-list li").hover(fooin, fooout)
  # window.generateTimeline(window.exp, window.edu);
  $("#timelineItem_ehsa, #timelineItem_egsa").each ()->
    $(this).attr("class", $(this).attr("class") + " unobtrusive")

