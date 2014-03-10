class ConfiguracionesController < ApplicationController

  def index
    @search = Arte.search(params[:search])
    @artes = @search.page(params[:page]).per(2)

    respond_to do |format|
      format.html # index.html.erb
      format.json
    end
  end

  def enviar_mails


    if params[:profesion_id].sort!.first.to_i == 0 then
      destinatarios = Persona.all
    else
      destinatarios = Persona.where('id in (?)',params[:profesion_id])
    end

    plantilla = Invitacion.find(params[:invitacion])

    afiches = Arte.where('id in (?)',params[:artes])


    @afiches = afiches
    @plantilla = plantilla




    grupo_destinatarios = Array.new

    destinatarios.each do |d|
      d.cuentas_correos.each do |ccd|
        grupo_destinatarios.push(ccd.correoe)
      end
    end
    enviados = []
    cuentas = Correo.where("cantidad_restantes > 0")

    limite = 0
    grupos_mail=[]

    cuentas.each do |cu|

      if grupo_destinatarios.size > 0 then
        (1..cu.cantidad_restantes).each do |re|
          limite +=1
          if limite <= 500 then
            enviados.push(grupo_destinatarios[0])
            grupo_destinatarios.delete_at(0)
          else
            grupos_mail.push(enviados)
            enviados = []
            limite=0
          end

          if re==cu.cantidad_restantes && !enviados.empty? then
            grupos_mail.push(enviados)
            enviados = []
            limite=0
            break
          else
            if grupo_destinatarios.size == 0 && !enviados.empty? then
              grupos_mail.push(enviados)
              enviados = []
              limite=0
              break
            end
          end
        end
        grupos_mail.push("andres.chavex@gmail.com")
        grupos_mail.push("andres19x@hotmail.com")
        grupos_mail.each do |gm|
          Notificacion.notificacion(gm,plantilla,afiches,cu.nombre).deliver
          cu.update_attribute(:cantidad_enviados, cu.cantidad_enviados + gm.size)
          cu.update_attribute(:cantidad_restantes, cu.cantidad_restantes - gm.size)
        end
      else
        break
      end
    end

    redirect_to configuraciones_path
  end

end
