module EvanStyle
  module Positive
    def motivate # action名不要大寫，不然呼叫時候變常數
      "Life is great! Fucker!:)"
    end
  end

  module Negative
    def demotivate
      "Life is suck! Fucker!:("
    end

    module Nonsense
      def self.diss
        "Life is just like a chocolate!:("
      end
    end
  end
end
