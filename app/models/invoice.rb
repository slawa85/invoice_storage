class Invoice < ActiveRecord::Base
  belongs_to :client
  belongs_to :category
  belongs_to :company
end
