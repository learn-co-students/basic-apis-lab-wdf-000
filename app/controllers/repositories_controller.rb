class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['token'] = 'c196d215a87f293b848e6904118d2c66bec1ed21'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repositories = body["items"]
      else
        @error = body["message"]
      end

      rescue Faraday::TimeoutError
        @error = "There was a timeout. Please try again."
      end
      render 'search'
  end

end
