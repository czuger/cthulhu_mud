class InTheNewsPlace < ActiveRecord::Base
  belongs_to :game_board
  belongs_to :place
  belongs_to :in_the_news_headline
end
