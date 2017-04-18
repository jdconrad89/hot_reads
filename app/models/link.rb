class Link < ApplicationRecord
  validates :url, presence: true

  scope :hot_reads, -> (cap = 10) { order("links.read_count DESC").limit(cap)}
end
