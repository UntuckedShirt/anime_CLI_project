require "pry"
require "httparty"


class Anime 
    attr_reader :title, :id, :synopsis, :type, :score, :episodes, :airing, :rated, :score, :members, :start_date, :end_date

    @@all = []
    def initialize(hash)
        hash.each do |k,v|
            self.send("#{k}=", v)
        end
        save
    end 

    def self.all
        @@all
    end

    def save 
        @@all << self
    end
    
    def is_popular
        members > 20000 ? true : false
    end 

    def is_airing 
    end_date ? false : true
    end 

    private 

    def title=(title)
        @title = title
    end
    def id=(id)
        @id = id
    end
    def synopsis=(synopsis)
        @synopsis = synopsis
    end
    def airing=(airing)
        @airing = airing
    end
    def type=(type)
        @type = type
    end
    def score=(score)
        @score = score
    end
    def start_date=(start_date)
        @start_date = start_date
    end
    def end_date=(end_date)
        @end_date = end_date
    end
    def episodes=(episodes)
        @episodes = episodes
    end
    def members=(members)
        @members = members
    end
    def rated=(rated)
        @rated = rated
    end
end 