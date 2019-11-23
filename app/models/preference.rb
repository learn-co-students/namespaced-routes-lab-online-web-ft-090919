class Preference < ApplicationRecord

    # below method would toggle setting on/off
    
    def self.toggle_artists
        # toggle the true/false value
        # .all means we change the setting for all, just in case we accidentally create more than one instance
        # could reformat to instance method as well if users had individual preferences
        
        # Preference.all.each do |p|
        #     p.allow_create_artists= !p.allow_create_artists
        #     p.save
        # end

    end

end
