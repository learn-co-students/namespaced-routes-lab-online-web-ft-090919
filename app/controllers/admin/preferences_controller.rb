class Admin::PreferencesController < ApplicationController
    def index
        if Preference.last
            @preference = Preference.last
        end
    end

    def show
        @preference = Preference.find_by(id: params[:id])
        if @preference.nil?
            redirect_to admin_preferences_path
        end
    end

    def new
        @preference = Preference.new
    end

    def create
        @preference = Preference.new(allow_create_artists: params[:preference][:allow_create_artists], allow_create_songs: params[:preference][:allow_create_songs])
        if @preference.save
            redirect_to admin_preference_path(@preference)
        else
            redirect_to admin_new_preference_path
        end
    end

    def edit
        @preference = Preference.find_by(params[:id])
        if @preference.nil? || @preference.id != Preference.last.id
            @preference = Preference.last
        end
    end

    def update
        @preference = Preference.find_by(params[:id])
        if @preference.id != Preference.last.id
            @preference = Preference.last
        end
        @preference.update(allow_create_artists: params[:preference][:allow_create_artists], allow_create_songs: params[:preference][:allow_create_songs])
        redirect_to admin_preference_path(@preference)
    end


    private
    def preference_params
        params.require(:preference).permit(:allow_create_artists, :allow_create_songs)
    end
end