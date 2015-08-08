module Comable
  module Apartment
    module ApplicationHelper
      def link_to_save
        link_to Comable.t('apartment.save'), 'javascript:$("form").submit()', class: 'btn btn-primary'
      end
    end
  end
end
