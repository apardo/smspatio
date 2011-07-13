namespace :svn do
  desc "Configurar subversion para Rails"
  task :configure do
    system "svn remove log/*"
    system "svn commit -m 'borrados todos los logs de subversion'"
    system 'svn propset svn:ignore "*.*" log/'
    system "svn update log/"
    system "svn commit -m 'ignorar todos los ficheros en log/'"

    system "svn remove tmp/*"
    system "svn commit -m 'borra el contenido del directorio tmp/'"
    system 'svn propset svn:ignore "*" tmp/'
    system "svn update tmp/"
    system "svn commit -m 'ignorar el contenido del directorio tmp/'"

    system 'svn propset svn:ignore "schema.rb" db/'
    system "svn update db/"
    system "svn commit -m 'ignorar el fichero schema.rb del directorio db/'"

    system "svn move config/database.yml config/database.example"
    system "svn commit -m 'mover el fichero database.yml a database.example para tener una plantilla del mismo'"
    system 'svn propset svn:ignore "database.yml" config/'
    system "svn update config/"
    system "svn commit -m 'ignorar el fichero database.yml'"

    system "svn remove public/index.html"
    system "svn commit -m 'public/index.html borrado'"
  end
   
  desc "Añadir nuevos ficheros al Subversion"
  task :add_files do
    system "svn status | grep '^\?' | sed -e 's/? *//' | sed -e 's/ /\ /g' | xargs svn add"
  end
end
