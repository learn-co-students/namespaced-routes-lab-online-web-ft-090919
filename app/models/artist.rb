class Artist < ActiveRecord::Base
  has_many :songs
  # before_action :check_preferences

  private

  def check_preferences
    # Preference.first.
  end
end
