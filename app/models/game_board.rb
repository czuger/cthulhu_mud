class GameBoard < ActiveRecord::Base

  PRESAGES = [ :comets, :eclipse, :constellation, :star ]

  include GameBoardSetting::TurnManagement

  has_many :investigators, dependent: :destroy

  has_many :clues, dependent: :destroy
  has_many :places_where_there_are_clues, class_name: 'Place', through: :clues, source: :place

  has_many :in_the_news_places, dependent: :destroy
  has_many :places_where_the_news_says_there_are_clues, class_name: 'Place', through: :in_the_news_places, source: :place

  has_many :portals, dependent: :destroy
  has_many :places_with_portals, class_name: 'Place', through: :portals, source: :place
  has_many :discovered_portals, -> { where( discovered: true ) }, class_name: 'Portal'
  has_many :places_with_discovered_portals, class_name: 'Place', through: :discovered_portals, source: :place

  has_many :portals, dependent: :destroy
  has_many :game_board_logs, -> { order 'created_at desc' }, dependent: :destroy

end
