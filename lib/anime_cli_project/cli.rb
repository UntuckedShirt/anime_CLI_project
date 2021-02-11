##executes all

#ANIME_URL = "https://api.jikan.moe/v3"

class CLI


    def commands (animes)
        
        puts "Please select an anime by the index number"
        input = gets.strip.to_i
        if input >= 1 && input <= animes.length
            anime = animes[input - 1]
            puts "#{anime.title} #{anime.synopsis}"
            puts "Would you like more info? Type hai for yes or chotto for no"
            input = gets.strip 
            if input.downcase == "hai" || input.downcase == "y"
                more_info(anime)
            else
                input.downcase == "chotto" || input.downcase == "n"
           
            end
        else 
            puts "BAKA!!! I think you typed a letter, please select a number from the list:"
            commands(animes)
        end
        puts "Would you like to revisit the list or exit?"
        puts "type 'hai' for yes or 'chotto' for no"
        
        input = gets.strip 
            
            if input.downcase == "hai" || input.downcase == "y"
                list_animes(animes)
                
            else
                input.downcase == "hakai" || input.downcase == "hakai"
                Kernel.exit
            end
        
    end 

    def more_info(anime)
        puts "Youre wish is granted! Here is more info on #{anime.title}"
        puts "Member Count: #{anime.members}"
        puts "Airing: #{anime.airing ? "It is still on air" : "it ended :("}"
        puts "Rating: #{anime.rated}"
        puts "Score: #{anime.score}"
        puts "Episodes: #{anime.episodes}"
        puts "#{anime.is_popular ? "I'd binge this again" : "Ehh, this is kind of trash! Maybe try the Manga"}"
    end

    def run    
        anime_api = Api.new()
        input = ""
        puts "Konichiwa fellow weeb! I am Shenlong and welcome to your anime search library! We have thousands to choose from so make sure to grab your favorite wagashi!"

        puts "Choose an anime you would you like to look up and I will grant you your wish!"

        puts "To quit, type 'hakai'."
            
         while input != "hakai"
                        
            input = gets.chomp
            
            if input == "hakai"
                puts "Destroying Worlds..."
            else    
                animes = anime_api.find_anime_by_name(input)
                if animes 
                    list_animes(animes)
                else 
                    puts "Are you unfamiliar with anime? Please try again!"
                end
            end
        end
    end
        

        
    def list_animes(animes)
        animes.each.with_index(1) do |anime, index|
            puts "#{index}. #{anime.title}"
        end
        commands(animes)
    end
        
end