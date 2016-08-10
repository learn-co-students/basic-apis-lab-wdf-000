class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
  if @resp.success?
    @repo = body["items"].first
  # else
  #   @error = body["meta"]["errorDetail"]
  end
  render 'search'
  end
end
