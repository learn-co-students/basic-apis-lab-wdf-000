class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    # begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        client_id='91e20a058fe64bba792a'
        client_secret='6452df63d6f977744104b1d78e82b37945709abf'
        # client_id='bf067969297acadbf3a7'
        # client_secret='5f5b72e2d33b2f32d53534ce318524c5ef967014'
        req.params['client_id'] = client_id
        req.params['client_secret'] = client_secret
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @venues = body["items"]
      else
        @error = body["message"]
      end
    # rescue Faraday::TimeoutError
    #   @error = "There was a timeout. Please try again."
    # end
    render 'search'
  end
end
