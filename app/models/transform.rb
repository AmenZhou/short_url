class Transform < ActiveRecord::Base
  validates :long_url, presence: true
  before_create :generate_short_url

  def to_param
    "#{id}#{short_url}"
  end

  private

  def generate_short_url
    self.short_url = "s#{time_now}"
  end

  def time_now
    Time.now.strftime("%Y%m%d%H%M")
  end
end
