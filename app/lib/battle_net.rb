require 'net/http'

module BattleNet

  def self.access_token
    client_credentials = Setting["client_credentials"]
    unless client_credentials && Time.parse(client_credentials["expires_at"]).future?
      request = Faraday.new("https://us.battle.net") do |conn|
        conn.basic_auth(ENV['BNET_CLIENT_ID'], ENV['BNET_CLIENT_SECRET'])
      end
      data = JSON.parse(request.post("/oauth/token", "grant_type=client_credentials"))
      data["expires_at"] = data["expires_in"].seconds.from_now
      Setting["client_credentials"] = data
      data["access_token"]
    else
      client_credentials["access_token"]
    end
  end

  def self.get(path, namespace = "dynamic-us")
    request = Faraday.new("https://us.api.blizzard.com") do |conn|
      conn.authorization :Bearer, access_token
    end
    JSON.parse(request.get(path, namespace: namespace, locale: 'en_US').body)
  end
end
