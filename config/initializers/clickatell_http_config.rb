# Cargar la configuración de la API HTTP de Clickatell
CLICKATELL_HTTP_CONFIG = YAML.load(File.open(File.join(RAILS_ROOT, 'config', 'clickatell_http.yml')))
