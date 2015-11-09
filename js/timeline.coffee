---
---
months_de = ["",
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

months_en = ["",
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
]

months = ["",
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
]


parseDate = (datestring) ->
  # could be Just a Year "2012", or Month Year "Januar 2013", or "jetzt"
  if datestring == "jetzt" or datestring == "now"
    return new Date()
  day = "01"
  if " " not in datestring
    month = "01"
    year = datestring
  else
    tmp = datestring.split(" ")
    month = "0" + months_en.indexOf(tmp[0])
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
  tmp = getTimeSpan expart.timeframe_en
  end_date = new Date(tmp[1].getFullYear(), tmp[1].getMonth() + 1, 0)
  {
    "starting_time": Date.parse tmp[0]
    "ending_time": Date.parse end_date
    "id": expart.uid
  }

getTimeFromLinux = (expart) ->
  tmp = getTimeSpan expart.timeframe_en
  end_date = new Date(tmp[1].getFullYear(), tmp[1].getMonth() + 1, 0)
  {
    "starting_time": Date.parse tmp[0]
    "ending_time": Date.parse end_date
    "id": expart.uid
    "label": expart.short_description
    "color": expart.color
  }

getTimeFromProgramming = (expart) ->
  tmp = getTimeSpan expart.timeframe
  end_date = new Date(tmp[1].getFullYear(), tmp[1].getMonth() + 1, 0)
  {
    "starting_time": Date.parse tmp[0]
    "ending_time": Date.parse end_date
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

programmingTimeframes = (edu, exp) ->
  # ret = []
  [




  ]

window.generateTimeline = (exp, edu, linux) ->
  education = ruby2json edu
  experience = ruby2json exp
  linux = ruby2json linux

  chartData = [
    {
      label: "Ausbildung"
      times: (getTimeFromExp edupart for edupart in education)
    }
    {
      label: "Erfahrung"
      times: (getTimeFromExp expart for expart in experience)
    }
    {
      label: "Linux"
      times: (getTimeFromLinux expart for expart in linux)
    }
    {
      label: "Basic Programmierung"
      times: [
        {
          "starting_time": Date.parse(new Date("1997-01-01"))
          "ending_time": Date.parse(new Date("2001-01-01"))
        }
      ]
    }
    {
      label: "C / C++ Programmierung"
      times: [
        {
          "starting_time": Date.parse(new Date("2002-09-01"))
          "ending_time": Date.parse(new Date("2007-01-01"))
        }
      ]
    }
    {
      label: "Java Programmierung"
      times: [
        {
          "starting_time": Date.parse(new Date("2003-09-01"))
          "ending_time": Date.parse(new Date("2008-10-01"))
        }
      ]
    }
    {
      label: "PHP Programmierung"
      times: [
        {
          "starting_time": Date.parse(new Date("2006-01-01"))
          "ending_time": Date.parse(new Date("2007-01-01"))
        }
        {
          "starting_time": Date.parse(new Date("2009-01-01"))
          "ending_time": Date.parse(new Date("2010-01-01"))
        }
        {
          "starting_time": Date.parse(new Date("2014-04-01"))
          "ending_time": Date.parse(new Date())
        }
      ]
    }
    {
      label: "Python Programmierung"
      times: [
        {
          "starting_time": Date.parse(new Date("2007-10-01"))
          "ending_time": Date.parse(new Date())
        }
      ]
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
  $("#timelineItem_ehsa, #timelineItem_egsa").each ()->
    $(this).attr("class", $(this).attr("class") + " unobtrusive")

