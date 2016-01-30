class Place < ActiveRecord::Base

  include Language::Articles

  has_closure_tree
  has_many :game_actions, dependent: :destroy, foreign_key: :location_id

  has_many :travels, foreign_key: :place_from_id
  has_many :neighbours, class_name: 'Place', foreign_key: :place_to_id, through: :travels, source: :place_to

  # Example : la gare a Arkham
  def full_location_name
    parent_string = parent ? parent.name_with_preposition : ''
    name_with_article + ' ' + parent_string
  end

  # Alias for full_location_name
  def name_with_ancestors
    full_location_name
  end

  def translated_name
    I18n.t( "places.#{cleaned_code}", default: default_translation )
  end

  # Le - la - les
  def name_with_article
    definite_article + translated_name
  end

  # Du - de - la - de l'
  def name_with_partitive_article
    partitive_article + translated_name
  end

  # A - au - aux
  def name_with_locative_prep
    ( locative_prep + ' ' + translated_name )
  end

  # De, du, d'
  def name_with_preposition
    ( preposition + translated_name )
  end

  def parent_with_locative_prep
    parent ? parent.name_with_locative_prep : ''
  end

  def cleaned_code
    code.downcase.gsub( /[^a-z]/, '_' )
  end

  def cleaned_default_translation
    default_translation.downcase.gsub( /[^a-z]/, '_' )
  end

end
