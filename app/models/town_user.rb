class TownUser < ActiveRecord::Base    
    belongs_to :user
    belongs_to :town
    end