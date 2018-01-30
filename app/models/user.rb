class User < ApplicationRecord
  before_save :salted

  def salted
    # 在model裡面要找到創造object完的那個實例，用self
    if self.id.blank?
      self.password = 'aaaaa' + self.password
    end
  end
end
