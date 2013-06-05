$ ->
  $(".terms-input").each ->
    el = $(@)
    availableTerms = el.data('terms')
    split = (val) -> val.split( /,\s*/ )
    extractLast = (term) -> split(term).pop()

    el.bind "keydown", (event) ->
      if event.keyCode == $.ui.keyCode.TAB and el.data("ui-autocomplete").menu.active
        event.preventDefault()
    .autocomplete
      appendTo: el.parent()
      minLength: 0
      source: (request, response) ->
        response($.ui.autocomplete.filter(availableTerms, extractLast(request.term)))
      focus: ->
        false
      select: (event, ui) ->
        terms = split(@value)
        terms.pop()
        terms.push(ui.item.value)
        terms.push("")
        @value = terms.join(", ")
        false
