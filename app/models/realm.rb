class Realm < ApplicationRecord

  def self.sync
    BattleNet.get("/data/wow/connected-realm/index")["connected_realms"].each do |link|
      uri = URI.parse(link["href"])
      connected_realm = BattleNet.get(uri.path)
      connected_realm["realms"].each do |realm|
        Realm.find_or_create_by(slug: realm["slug"]) do |r|
          r.name = realm["name"]
          r.connected_realm = connected_realm["id"]
        end
      end
    end
  end
end
