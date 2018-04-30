class EvanGirl
  extend EvanStyle::Positive
  include EvanStyle::Negative


  def self.number
    14
  end

  def self.diss
    Nonsense.diss
  end

  # 當 include EvanStyle::Negative時候，其實就好像把這些code複製到這邊
  # def demotivate
  #   "Life is suck! Fucker!:("
  # end
  #
  # module Nonsense
  #   def diss
  #     "Life is just like a chocolate!:("
  #   end
  # end
  # 但是沒辦法直接access module裡面的method
  # 所以說再加上include Nonsense 就再解開module Nonsense，就可以用diss方法了
end
