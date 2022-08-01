class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :must_be_click_batey

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
  ]

  def must_be_click_batey
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add( :title, 'must be clickbait' )
    end
  end
end
