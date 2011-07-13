namespace :sms do
  desc "Enviar mensajes SMS encolados"
  task(:send_sms => :environment) do
    # Mensajes que no han sido mandados
    messages = Message.find(:all, :conditions => ["sent = ?", false])
    if messages.size > 0
      contacts = Contact.find(:all)
      messages.each do |message|
        # Marcamos el mensaje como enviado
        message.sent = true
        message.save
        # Eviamos el mensaje
        Mailer.deliver_send_sms(contacts, message.body)
      end
    end
  end
end
