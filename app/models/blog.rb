class Blog < ApplicationRecord
  belongs_to :user
  scope :published, -> { where(published: true) }

  def self.search(term)
    if term
      published.where('title LIKE ?', "%#{term}%")
    else
      published.all
    end
  end
end
