class SearchesController < ApplicationController
  def index
    @query = params[:query]

    # @search_result = {
    #   'beers' => beers_index(@query),
    #   'breweries' => breweries_index(@query),
    #   'flavors' => flavors_index(@query),
    # }

    @search_result = []
    @search_result += beers_index(@query)
    @search_result += breweries_index(@query)
    @search_result += flavors_index(@query)
    @search_result
  end

  def beers_index(query_string)
    q = "%#{query_string.downcase}%"
    Beer.where('lower(name) LIKE ?', q)
    # .limit(8)
  end

  def breweries_index(query_string)
    q = "%#{query_string.downcase}%"
    bw = Brewery.where('lower(name) LIKE ?', q)
    Beer.where(brewery: bw)
    # .limit(8)
  end

  def flavors_index(query_string)
    q = "%#{query_string.downcase}%"
    Beer.where('lower(flavors) LIKE ?', q)
    # .limit(8)
  end


end
