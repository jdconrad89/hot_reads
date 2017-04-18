class Api::V1::LinksController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @links = Link.all.order(read_count: :DESC).limit(10)
    render json: @links
  end

  def create
    link = params["url"]
    found_link = Link.find_or_create_by(url: link)
    reads = found_link.read_count
    if reads.nil? || reads < 1
      found_link.update(read_count: 1)
    else
      found_link.update(read_count: found_link.read_count + 1)
    end
  end
end
