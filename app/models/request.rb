class Request < ApplicationRecord
  belongs_to :trap
  serialize :headers, Hash
  serialize :cookies
end
