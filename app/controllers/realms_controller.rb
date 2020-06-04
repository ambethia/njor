class RealmsController < ApplicationController
  def index
    @subscribed_realm_ids = Setting["subscribed_realm_ids"]
    @realms = Realm.order(:name).all
  end

  def subscribe
    connected_realm = Realm.find(params[:id]).connected_realm
    Setting["subscribed_realm_ids"] = Setting["subscribed_realm_ids"].push(connected_realm).uniq
    redirect_to :realms, notice: 'Subscribed!'
  end

  def unsubscribe
    connected_realm = Realm.find(params[:id]).connected_realm
    Setting["subscribed_realm_ids"] = Setting["subscribed_realm_ids"].filter  { |id| id != connected_realm }
    redirect_to :realms, notice: 'Unsubscribed!'
  end
end
