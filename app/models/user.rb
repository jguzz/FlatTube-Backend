class User < ApplicationRecord
 has_many :comments
 has_many :videos, through: :comments
 has_many :likes 
 has_many :videos, through: :likes
end
