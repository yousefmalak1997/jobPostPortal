class JobsApplication < ApplicationRecord
  belongs_to :user ,:optional => true
  belongs_to :job  ,:optional => true
end
