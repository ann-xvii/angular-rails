class Comment < ActiveRecord::Base
	references :post
	belongs_to :user
end
