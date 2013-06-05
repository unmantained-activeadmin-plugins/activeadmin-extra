$ ->
  if jQuery().chosen
    $(".chosen-input").each ->
      $this = $(@)
      $this.chosen
        create_option: !!$this.data('create-option')
