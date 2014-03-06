class Notificacion < ActionMailer::Base
  default from: "coordinacionscr@gmail.com"

  def notificacion(destinatarios,plantilla,afiches)
    @afiches = afiches
    @plantilla = plantilla


    if(plantilla.id == 1)
      afiches.all.each do |a|
        attachments['imagen' + a.id] = File.read( Rails.root.join("#{Rails.root.to_s + "/public/" + a.invitacionfile.to_s}") )
      end
    else
      afiches.all.each do |a|
        attachments.inline['imagen' + a.id] = File.read( Rails.root.join("#{Rails.root.to_s + "/public/" + a.invitacionfile.to_s}") )
      end
    end

    grupo_destinatarios = Array.new

    destinatarios.all.each do |d|
        grupo_destinatarios.push(d.correoe)
    end

    cuentas = Correo.where("cantidad_restantes > 0")
    Notificacion.mailer_name= cuenta_correo

    mail_cant =[]
    grupos_mail=[]
    cuentas.each do |cu|
          grupos = (1..cu.cantidad_restantes).to_a.in_groups_of(500)

          grupos.each do |g|
              g = g.reject(&:nil?)
               # ya se tiene las cantidades de correos a enviar por grupos de cuentas agrupados de 500
          end
    end







    mail(:to => grupo_destinatarios, :subject => "#{@plantilla.asunto.to_s}")do |format|
      format.html {
        render "notificacion/" + plantilla
      }
    end





  end

end
