# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  window.muestraMensajeBloqueante = (mensaje)->
    $.blockUI({
              message: mensaje
              css:
                border: 'none',
                padding: '15px',
                backgroundColor: '#000',
                '-webkit-border-radius': '10px',
                '-moz-border-radius': '10px',
                opacity: 0.5,
                color: '#fff'
              })

  $("#artes_buscar").keyup ->
    keys = []
    $('table tbody.artes_body').find('tr').each ->
      keys.push($(this).find('input').val())


    if $(this).val() != ""
      $.ajax '/artes',
             method: "GET",
             dataType: 'json',
             data: {search: {nombre_contains : $(this).val(), id_not_in: keys }},
             success: (data) ->
               $('table tbody#artes_body').find("tr").remove()
               $.each(data, (id, afiche) ->
                 $('table tbody#artes_body').append('
                   <tr>
                     <td>
                       <input id="artes_cb" name="artes[]" type="checkbox" value=' + afiche['id'] + '>
                     </td>
                     <td>' + afiche['nombre'] + '</td>
                     <td>
                       <img alt="Imagen Afiche" src=' + afiche['invitacion_file']['mini']['url'] + '>
                     </td>
                   </tr>')
               )
             error: (response) ->
               alert " OCURRIÓ UN ERROR, INTENTE NUEVAMENTE "
               alert response.responseText

  $('#artes_body').on "click","input#artes_cb", ->
    $('table tbody.artes_body').append($(this).parent().parent())

  $('.artes_body').on "click","input#artes_cb", ->
    $(this).parent().parent().remove()
