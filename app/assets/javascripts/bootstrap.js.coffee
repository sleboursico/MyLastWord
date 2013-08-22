jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

  $ ->
$("form[data-remote]").on "ajax:success", (e, data, status, xhr) ->
  alert "The post was deleted."