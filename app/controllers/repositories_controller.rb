class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = ENV['github_id']
      req.params['client_secret'] = ENV['github_secret']
    end
      @results = JSON.parse(resp.body)['items']
      render 'search'
  end

end
