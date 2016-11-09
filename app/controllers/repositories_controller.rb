class RepositoriesController < ApplicationController

  def search

  end



  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '33e5f15b4d75f2199427'
      req.params['client_secret'] = '48c4a61afdba3d58121455d7dfb1bd68e0f0f4ff'
      req.params['q'] = params[:query]
    end
    @body = JSON.parse(resp.body)
    render 'search'
  end





end
