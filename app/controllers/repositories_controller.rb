class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    begin
      resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query] + "+language:assembly"
        req.params['sort'] = "stars"
        req.params['order'] = "desc"
        req.options.timeout = 10
      end
      @repos = JSON.parse(resp.body)["items"]
    rescue Faraday
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
