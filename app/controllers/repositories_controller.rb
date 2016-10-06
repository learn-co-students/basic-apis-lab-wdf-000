class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    url = "https://api.github.com/search/repositories"
    response = Faraday.get(url) do |req|
      req.params['client_id'] = ENV["github_client_id"]
      req.params['client_secret'] = ENV["github_client_secret"]
      req.params['q'] = params[:query]
    end
    
    resp_json = JSON.parse(response.body)
    if response.success?
      @repos = resp_json["items"]
    else 
      @error = resp_json["message"]
    end

    render 'search'
  end
end
