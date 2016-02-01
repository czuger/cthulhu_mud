# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $( '.health_selector' ).change ->
    sum = 0
    $( '.health_selector' ).each ->
      sum += parseInt( $(this).val() )

    max_health_points = parseInt( $( '#health_points' ).val() )
    $( '#health_remaining_points' ).html( max_health_points - sum )

  $( '.comp_selector' ).change ->
    sum = 0
    $( '.comp_selector' ).each ->
      sum += parseInt( $(this).val() )

    max_comp_points = parseInt( $( '#comp_points' ).val() )
    $( '#comp_remaining_points' ).html( max_comp_points - sum )


