class GameBoard < ActiveRecord::Base

  PRESAGES = [ :comet, :eclipse, :constellation, :star ]
  MAX_TURNS = 20
  INVESTIGATORS_ACTIONS_POINTS = 3

  include GameBoardSetting::TurnManagement

  has_many :investigators, dependent: :destroy
  has_many :avaliable_investigators, -> { where( mad: false, dead: false ) }, class_name: 'Investigator', foreign_key: :game_board_id

  has_many :game_action_logs, through: :investigators, class_name: 'GameActionLog'

  has_many :clues, dependent: :destroy
  has_many :places_where_there_are_clues, class_name: 'Place', through: :clues, source: :place

  has_many :in_the_news_places, dependent: :destroy
  has_many :places_where_the_news_says_there_are_clues, class_name: 'Place', through: :in_the_news_places, source: :place

  has_many :portals, dependent: :destroy
  has_many :places_with_portals, class_name: 'Place', through: :portals, source: :place
  has_many :discovered_portals, -> { where( discovered: true ) }, class_name: 'Portal'
  has_many :undiscovered_portals, -> { where( discovered: false ) }, class_name: 'Portal'
  has_many :places_with_discovered_portals, class_name: 'Place', through: :discovered_portals, source: :place

  has_many :portals, dependent: :destroy
  has_many :game_board_logs, -> { order 'created_at desc' }, dependent: :destroy

  has_many :monster_on_boards
  has_many :monsters, class_name: 'Monster', through: :monster_on_boards, source: :monster

end
