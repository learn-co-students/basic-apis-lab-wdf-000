
class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
    req.params['q'] = search_params
    req.params['client_id'] = "997c53168432e57a591f"
    req.params['client_secret'] = "15c28396ae8f53114761908e3981c9ca2172394b"
  end
  # binding.pry
  body = JSON.parse(@resp.body)
  if @resp.success?
    @items = body["items"]

  else
    @error = body["meta"]["errorDetail"]
  end
  render 'search'
  end

  private
  def search_params
    params.require(:query)
  end
end
