namespace :admin do
  desc "Introducir contactos desde un fichero"
  task(:entercontacts => :environment) do
    # Fichero con los contactos
    data = ENV['FILENAME']

    # Abrir el fichero con los contactos
    file = File.open(data)
    # Leer línea a línea
    file.each_line {|line|
      contact = Contact.create(:phone => line.strip)
      if contact.save
        puts "Contacto #{contact.phone} introducido en la DB"
      else
        puts contact.errors['phone']
      end
    }
  end
end
