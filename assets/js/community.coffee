---
---

(($) ->
  $('#filter').keyup (event) ->
    $el = $(event.target)
    rex = new RegExp($el.val(), 'i')

    $('.org-type').show()
    $('.org-type .org').hide()
    $('.org-type .org').filter( ->
      rex.test $(this).text()
    ).show()

    $('.org-include').each (i, include) ->
      $include = $(include)

      $("##{$include.attr("id")} .org-type").each (i, type) ->
        $type = $(type)
        if $("##{$type.attr("id")} .org:visible").length == 0
          $type.hide()
        else
          $type.show()

      if $("##{$include.attr("id")} .org:visible").length == 0
        $include.children('.no-matches').show()
      else
        $include.children('.no-matches').hide()

) jQuery
