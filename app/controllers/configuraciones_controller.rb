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
    plantilla = Invitacion.find(params[:invitacion])
    destinatarios = Persona.where('profesion_id in (?)',params[:profesion_id])
    afiches = Arte.where('id in (?)',params[:artes])

    Notificacion.notificacion(destinatarios,plantilla,afiches).deliver
  end
end
