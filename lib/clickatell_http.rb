require 'clickatell'

class ClickatellHTTP 

  def initialize(config)
    @config = config
  end

  def balance
    api.account_balance
  end

  private
    def api
      @api ||= Clickatell::API.authenticate(
        @config['api_key'],
        @config['username'],
        @config['password']
      )
    end
end
