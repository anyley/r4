# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

my_refresh = ->
    $('.my_class').click ->
        console.log('click')

page_change = ->
    console.log('page change')
    my_refresh()

$(document).on 'page:change', page_change

