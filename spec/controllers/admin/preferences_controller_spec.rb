require 'rails_helper'

RSpec.describe Admin::PreferencesController, type: :controller do
  
  it "has an index page" do
    get :index
    expect(response).to be_ok
  end

  describe "toggle artist creation" do
    
    it "uses a link to toggle settings" do
      get :toggle_artists
      expect(response).to redirect_to admin_preferences_path
    end
    
    it "changes the setting for creating artists" do
      Preference.create(allow_create_artists: true)
      get :toggle_artists
      expect(Preference.last.allow_create_artists).to eq false
    end

  end

end
