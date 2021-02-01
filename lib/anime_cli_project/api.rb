require "pry"
require "httparty"
require_relative "./anime"


class Api
    attr_reader :url


    def initialize
        @url = "https://api.jikan.moe/v3"


    end

    def find_anime_by_name(name)
        req_url = "#{url}/search/anime?q=#{name}"
        data = HTTParty.get(req_url)
        anime_hash = {}
        # anime_name = Anime_name.new(data)
        data["results"].each do |res|
            # binding.pry
            anime_hash = {
                ## use data["results"]
                title: res["title"],
                synopsis: res["synopsis"],
                airing: res["airing"],
                type: res["type"],
                episodes: res["episodes"],
                score: res["score"],
                start_date: res["start_date"],
                end_date: res["end_date"],
                members: res["members"],
                rated: res["rated"]
            }
            ## create an obj 
            Anime.new(anime_hash)
        end
        # "title"=>"Goblin Slayer: Bouken Kiroku Youshi - Adventure Sheet",
        # "airing"=>false,
        # "synopsis"=>"Recap of the first 10 episodes of Goblin Slayer.",
        # "type"=>"Special",
        # "episodes"=>1,
        # "score"=>6.11,
        # "start_date"=>"2018-12-16T00:00:00+00:00",
        # "end_date"=>"2018-12-16T00:00:00+00:00",
        # "members"=>35493,
        # "rated"=>"R"
        # Anime.new(anime_hash)
        binding.pry
        
    end

end

# https://api.jikan.moe/v3/anime/id/request/parameter
# https://api.jikan.moe/v3/genre/type/genre_id/page



api = Api.new
api.find_anime_by_name("goblin_slayer")

## move anime to own file 

## add all the k,v pairs for anime 

## start building cli 

## watch where Dj built the pokecli 

## print out a list instead of displaying (Dj displays a poke)

## after a search we will print a list to pick form -> give title and synopsis, then ask if they want more info on this, or restart a search
