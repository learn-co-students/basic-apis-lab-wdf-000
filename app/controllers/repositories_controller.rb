class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = "Don't forget your ID"
        req.params['client_secret'] = "nor KEYs!"
        req.params['v'] = 'application/vnd.github.v3+json'
        req.params['q'] = params[:query]
        req.options.timeout = 5 ###This is in seconds, I think...
      end
      body = JSON.parse(@resp.body)
      # @repos = body
      if @resp.success?
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
