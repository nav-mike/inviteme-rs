class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  COUNT_PER_PAGE = 25

  paginates_per COUNT_PER_PAGE
end
