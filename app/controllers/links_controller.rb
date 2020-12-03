class LinksController < ApplicationController
  def show
    response = HTTParty.get("#{source}/#{params[:id]}")
    if response.code == 200
      redirect_to response["link"]["url"]
    else
      render file: "public/404.html"
    end
  end

  def create
    @response = HTTParty.post(source, body: link_params)
    render :new
  end

  private
  def link_params
    {
      link: {
        url: params[:link]
      }
    }
  end

  def source
    "#{ENV['API_HOST']}/links"
  end
end
