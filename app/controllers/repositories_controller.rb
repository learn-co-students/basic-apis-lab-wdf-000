class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "5067281445a19cfeeca5"
    secret = "1b63e194d405adad009f1ef0e88c6e6491eb6349"

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["5067281445a19cfeeca5"] = client_id
      req.params["1b63e194d405adad009f1ef0e88c6e6491eb6349"] = secret
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end


end
