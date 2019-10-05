require 'httparty'
require 'pp'

class Recipe
	include HTTParty
	
	FOOD2FORK_KEY=ENV["FOOD2FORK_KEY"]

	base_uri 'http://food2fork.com/api'
	default_params key: FOOD2FORK_KEY , sort: "r"
	format :json

	def self.for term
		get("/search", query:{q: term})["recipes"]
	end

end

pp Recipe.for 'lamb'

#https://www.food2fork.com/api/search?key=20d5dd39b5e8a46a002d154f31d24e8e&q=chicken%20breast&page=2 
#https://www.food2fork.com/api/search?key=20d5dd39b5e8a46a002d154f31d24e8e&q=lamb&sort=r
