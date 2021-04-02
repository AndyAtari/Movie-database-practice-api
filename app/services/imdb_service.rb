class ImdbService

    def get_plot_by_title(title)
        response = HTTP.get("http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]}&t=#{title}").to_s
        parsed_response = JSON.parse(response)
        parsed_response["Plot"]
    end
    
end