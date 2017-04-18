class LinksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @links = Link.hot_reads
  end

end
