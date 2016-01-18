# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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