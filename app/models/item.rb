class Item < ActiveRecord::Base

  has_and_belongs_to_many :places, join_table: :items_can_be_found_at_places

end

