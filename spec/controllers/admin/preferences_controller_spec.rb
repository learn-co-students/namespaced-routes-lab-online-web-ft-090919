require 'rails_helper'

RSpec.describe Admin::PreferencesController, type: :controller do
  before do
    @p = Preference.create(allow_create_artists: true)
  end
  
  it "has an index page" do
    get :index
    expect(response).to be_ok
  end

  it "has a way to toggle artist creation" do
    
    get :toggle_artists
    expect(response).to redirect_to admin_preferences_path
    expect(Preference.last.allow_create_artists).to eq true
    
  end

end
