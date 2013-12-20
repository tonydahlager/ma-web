module Varkek
  module Document
    extend ActiveSupport::Concern
    
    def id_to_s
      id.to_s
    end
    
  end
end
