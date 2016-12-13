class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "d7ba9337deca11c371ff"
      req.params['client_secret'] = "9dda45cdf70c76b4bd214fd4fecedc77239ceda3"
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @items = body["items"]
    else
      @error = "Sorry, error"
    end
    render 'search'
  end

end
