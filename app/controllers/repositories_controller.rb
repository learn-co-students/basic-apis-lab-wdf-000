class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = ENV['GITHUBID']
        req.params['client_secret'] = ENV['GITHUBSECRET']
        req.params['q'] = params[:query]
      end
      
      body = JSON.parse(@resp.body)
      if @resp.success?
        # binding.pry
        @repos = body["items"]
      else
        @error = body["meta"]["errorDetail"]
      end
    rescue Faraday::TimeoutError
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
