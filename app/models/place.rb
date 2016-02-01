class String
  def capitalize_first
    (slice(0) || '').upcase + (slice(1..-1) || '')
  end

  def capitalize_first!
    replace(capitalize_first)
  end
end

class Place < ActiveRecord::Base

  include Language::Articles

  has_closure_tree
  has_many :game_actions, dependent: :destroy, foreign_key: :location_id

  has_many :travels, foreign_key: :place_from_id
  has_many :neighbours, class_name: 'Place', foreign_key: :place_to_id, through: :travels, source: :place_to

  has_and_belongs_to_many :monsters

  # Example : la gare a Arkham
  def full_description_name
    unless city
      parent_string = parent ? parent.name_with_preposition : ''
      ( name_with_article + ' ' + parent_string ).capitalize_first
    else
      translated_name
    end
  end

  # Example : a la gare d'Arkham, aux quais d'Arkham, a Arkham
  def full_localisation_name
    if well_known_place
      parent_string = parent ? ' ' + parent.name_with_preposition : ''
    else
      parent_string = parent ? ', ' + parent.name_with_spatial_preposition_building_or_place : ''
    end
    name_with_spatial_preposition_building_or_place + parent_string
  end

  def parent_with_locative_prep
    parent ? parent.name_with_locative_prep : ''
  end

  def cleaned_default_translation
    default_translation.downcase.gsub( /[^a-z]/, '_' )
  end

  # De, du, d'
  def name_with_preposition
    if city
      ( preposition + translated_name.capitalize )
    else
      ( preposition + translated_name )
    end
  end

  # A - a la - au - aux
  def name_with_spatial_preposition_building_or_place
    result = ( locative_prep + ' ' + translated_name )

    unless city
      if gender == 'f'
        result = ( locative_prep + ' ' + definite_article + translated_name )
      elsif gender == 'm'
        vowels = I18n.t( 'vowels' )
        place_name = translated_name
        if vowels.include?( place_name[ 0 ].downcase )
          result = ( 'a' + ' ' + definite_article + translated_name )
        end
      end
    else
      result = ( locative_prep + ' ' + translated_name.capitalize )
    end

    result
  end

  private

  def translated_name
    I18n.t( "places.#{cleaned_code}", default: default_translation )
  end

  # Le - la - les
  def name_with_article
    definite_article + translated_name
  end

  # Du - de - la - de l'
  def name_with_partitive_article
    partitive_article + translated_name.capitalize
  end

  def cleaned_code
    code.downcase.gsub( /[^a-z]/, '_' )
  end

end
