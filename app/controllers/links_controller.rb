class LinksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @links = Link.all.order(read_count: :DESC).limit(10)
  end

def create
end

end
