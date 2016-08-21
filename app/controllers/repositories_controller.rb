class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      # req.params['client_id'] = '91e20a058fe64bba792a'
      # req.params['client_secret'] = '6452df63d6f977744104b1d78e82b37945709abf'
      # req.params['q'] = "#{params[:query]}+in:file"
      req.params['q'] = params[:query]
      # req.params['order'] = 'desc'
      # req.params['sort'] = 'stars'
    end
    body_hash = JSON.parse(resp.body)
    if resp.success?
      @repos = body_hash["items"]
    else
      byebug
      @error = body_hash['message']
    end
    render 'search'
  end
end
