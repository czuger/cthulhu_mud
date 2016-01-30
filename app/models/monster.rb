class Monster < ActiveRecord::Base

  has_and_belongs_to_many :places

  def cleaned_default_translation
    default_translation.downcase.gsub( /[^a-z]/, '_' )
  end

  def name
    I18n.t( "monsters.#{code}", default: default_translation )
  end

end
