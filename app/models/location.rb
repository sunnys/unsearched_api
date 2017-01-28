class Location < ApplicationRecord
	has_many :melocations
	has_many :my_memories, :through => :melocations
end
