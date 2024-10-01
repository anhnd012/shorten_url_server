class UrlsController < ApplicationController
  def create
    @url = Url.new(url_params)
    if @url.save
      render json: { short_code: short_url(@url.short_code)}, status: :created
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  def redirect
    @url = Url.find_by!(short_code: params[:short_code])
    redirect_to @url.long_url, allow_other_host: true
  end

  private

  def url_params
    puts "parans: #{params}"
    params.require(:url).permit(:long_url)
  end

  def short_url(short_code)
    "#{request.base_url}/#{short_code}"
  end

end
