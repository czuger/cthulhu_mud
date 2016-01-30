module Language::Articles

  private

  def preposition
    vowels = I18n.t( 'vowels' )
    place_name = translated_name
    if vowels.include?( place_name[ 0 ].downcase )
      I18n.t( 'prepositions.prec_by_vowel' )
    elsif gender == 'm'
      I18n.t( 'prepositions.masculin' )
    elsif gender == 'f'
      I18n.t( 'prepositions.feminin' )
    elsif gender == 'p'
      I18n.t( 'prepositions.plural' )
    else
      raise "#{self.class}##{__method__} : gender undefined #{self.inspect}"
    end
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
    vowels = I18n.t( 'vowels' )
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
    vowels = I18n.t( 'vowels' )
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
