class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
     req.params['client_id'] = 'bc078a6ff072bcf887b5'
     req.params['client_secret'] = '5cec1d2f6eb7f8425d50a4ceed2cf27cc7ff0400'
     req.params['v'] = 'v3+json'
     req.params['q'] = params[:query]
   end
  body_hash = JSON.parse(@resp.body)
  @results = body_hash["items"]
  #  binding.pry

   render 'search'
  end

end
