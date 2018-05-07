class SearchesController < ApplicationController
  def index
    @query = params[:query]

    @search_result = {
      'beers' => beers_index(@query),
      'breweries' => breweries_index(@query),
      'flavors' => flavors_index(@query),
      }
  end

  def beers_index(query_string)
    q = "%#{query_string.downcase}%"
    Beer.where('lower(name) LIKE ?', q)
    # .limit(8)
  end

  def breweries_index(query_string)
    q = "%#{query_string.downcase}%"
    Brewery.where('lower(name) LIKE ?', q)
    # .limit(8)
  end

  def flavors_index(query_string)
    q = "%#{query_string.downcase}%"
    Beer.where('lower(flavors) LIKE ?', q)
    # .limit(8)
  end


end
