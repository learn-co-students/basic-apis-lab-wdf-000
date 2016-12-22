class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  		req.params['client_id'] = '6e5008a173c42dd42b8d'
  		req.params['client_secret'] = 'a10435ede200cf658080d9d38af3516270f851d4'
  		req.params['q'] = params[:query]
  	end
  	body_hash = JSON.parse(@resp.body)
    if @resp.success?
      @search = body_hash["items"]
    else
      @error = body_hash["message"]
    end
    render 'search'
  end

end
