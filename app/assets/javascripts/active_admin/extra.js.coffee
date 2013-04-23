#= require active_admin/base

$ ->
  if $(".chosen-input").length > 0
    $(".chosen-input").chosen()

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

  $(".map-address-input").each ->
    $this = $(@)
    coords = $this.data('center')
    $lat = $this.find("[role=latitude]").hide()
    $lon = $this.find("[role=longitude]").hide()
    $address = $this.find("[role=address]")

    mapOptions =
      center: new google.maps.LatLng(coords[0], coords[1])
      zoom: $this.data('zoom')
      mapTypeId: google.maps.MapTypeId.ROADMAP

    map = $(".map", this).css(width: 500, height: 300).get(0)
    map = new google.maps.Map(map, mapOptions)
    geocoder = new google.maps.Geocoder()
    marker = null

    placeMarker = (location) ->
      map.setCenter(location)
      map.setZoom(14)
      marker.setMap(null) if marker
      marker = new google.maps.Marker(
        map: map,
        position: location,
        animation: google.maps.Animation.DROP,
        draggable: true
      )
      $lat.val(location.lat())
      $lon.val(location.lng())
      google.maps.event.addListener marker, "dragend", (event) ->
        coords = event.latLng
        $lat.val(coords.lat())
        $lon.val(coords.lng())

    $address.keypress (e) ->
      return unless e.which == 13
      address = $(@).val()
      geocoder.geocode 'address': address, (results, status) ->
        if status == google.maps.GeocoderStatus.OK
          placeMarker(results[0].geometry.location)
      false

    if $lat.val() && $lon.val()
      placeMarker new google.maps.LatLng($lat.val(), $lon.val())

