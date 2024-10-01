class Url < ApplicationRecord
  validates :long_url, presence: true, format: URI::regexp(%w[http https])
  validates :short_code, presence: true, uniqueness: true

  before_validation :generate_short_code

  private 

  def generate_short_code
    self.short_code = SecureRandom.alphanumeric(6) if short_code.blank?
  end
end
