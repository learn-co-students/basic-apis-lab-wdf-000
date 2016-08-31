module ApplicationHelper

  def github_url(item)
    "https://github.com/#{item['full_name']}"
  end 


end
