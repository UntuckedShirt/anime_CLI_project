require "pry"
require "httparty"

class Api
    attr_reader :url


    def initialize
        @url = "https://api.jikan.moe/v3"


    end

    def find_anime_by_name(name)
        req_url = "#{url}/search/anime?q=#{name}"
        data = HTTParty.get(req_url)
        anime_name_hash = #()
        anime_name = Anime_name.new(data)
        binding.pry
    end
end

# https://api.jikan.moe/v3/anime/id/request/parameter
# https://api.jikan.moe/v3/genre/type/genre_id/page



api = Api.new
api.find_anime_by_name("goblin_slayer")


