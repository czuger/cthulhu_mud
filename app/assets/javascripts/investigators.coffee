# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

root = exports ? this

$(document).ready ->

  $( '.gender_selector' ).change ->
    selected_value = $(this).val()

    $.get "/new_investigator_name/#{selected_value}", (data) ->
      console.log( data )
      $( '#investigator_name' ).val( data )

  $( '#change_name' ).click ->
    selected_value = $("input[name='investigator[gender]']:checked", '#new_investigator').val()

    $.get "/new_investigator_name/#{selected_value}", (data) ->
      console.log( data )
      $( '#investigator_name' ).val( data )

  refresh_timers = ->
    for timer in $( '.eta_show_area' )
      remaining_time = $( timer ).attr( 'eta' )
      remaining_time -= 1
      if remaining_time > 0
        d = new Date( remaining_time * 1000 )
        h = d.getUTCHours()
        m = d.getUTCMinutes()
        s = d.getUTCSeconds()

        if h < 10
          h = '0' + h
        if m < 10
          m = '0' + m
        if s < 10
          s = '0' + s

        $( timer ).html( "#{h}:#{m}:#{s}" )
        $( timer ).attr( 'eta', remaining_time )



  unless root.timer_on
    setInterval( refresh_timers, 1000 )
    root.timer_on = true

