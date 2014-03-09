class Notificacion < ActionMailer::Base
  default from: "coordinacionscr@gmail.com"

  def notificacion(destinatarios,plantilla,afiches,cuenta)
    @afiches = afiches
    Notificacion.mailer_name= cuenta
    file_plantilla = ''

    if(plantilla.tipo_adjunto == 'ADJUNTO')
      afiches.each do |a|
        attachments['imagen' + a.id.to_s + File.extname(a.invitacion_file.to_s) ] = File.read( Rails.root.join("#{Rails.root.to_s + "/public/" + a.invitacion_file.to_s}") )
        file_plantilla = 'plantilla1'
      end
    else
      afiches.each do |a|
        attachments.inline['imagen' + a.id.to_s + File.extname(a.invitacion_file.to_s) ] = File.read( Rails.root.join("#{Rails.root.to_s + "/public/" + a.invitacion_file.to_s}") )
        file_plantilla = 'plantilla2'
      end
    end

    mail(:to => destinatarios, :subject => "#{@plantilla.asunto.to_s}") do |format|
      format.html {
        render "notificacion/" + file_plantilla
      }
    end
  end

end
