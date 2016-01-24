class Place < ActiveRecord::Base

  has_closure_tree
  has_many :game_actions, dependent: :destroy, foreign_key: :location_id

  has_many :travels, foreign_key: :place_from_id
  has_many :neighbours, class_name: 'Place', foreign_key: :place_to_id, through: :travels, source: :place_to

  def name_with_ancestors
    ( [ name ] + ancestors.map{ |e| e.name } ).join( ' - ' )
  end

  def translated_name
    I18n.t( "places.#{cleaned_name}" )
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

  def parent_with_locative_prep
    parent ? parent.name_with_locative_prep : ''
  end

  private

  def cleaned_name
    self[:name].downcase.gsub( /[^a-z]/, '_' )
  end

  def locative_prep
    if gender == 'm'
      I18n.t( 'locative_prep.masculin' )
    elsif gender == 'f'
      I18n.t( 'locative_prep.feminin' )
    elsif gender == 'p'
      I18n.t( 'locative_prep.plural' )
    else
      raise "#{self.class}##{__method__} : gender undefined #{self.inspect}"
    end
  end

  def partitive_article
    vowels = I18n.t( 'definite_article.vowels' )
    place_name = translated_name
    if vowels.include?( place_name[ 0 ].downcase )
      I18n.t( 'partitive_article.prec_by_vowel' )
    elsif gender == 'm'
      I18n.t( 'partitive_article.masculin' )
    elsif gender == 'f'
      I18n.t( 'partitive_article.feminin' )
    elsif gender == 'p'
      I18n.t( 'partitive_article.plural' )
    else
      raise "#{self.class}##{__method__} : gender undefined #{self.inspect}"
    end
  end

  def definite_article
    vowels = I18n.t( 'definite_article.vowels' )
    place_name = translated_name
    if vowels.include?( place_name[ 0 ].downcase )
      I18n.t( 'definite_article.prec_by_vowel' )
    elsif gender == 'm'
      I18n.t( 'definite_article.masculin' )
    elsif gender == 'f'
      I18n.t( 'definite_article.feminin' )
    elsif gender == 'p'
      I18n.t( 'definite_article.plural' )
    else
      raise "#{self.class}##{__method__} : gender undefined #{self.inspect}"
    end
  end

end
