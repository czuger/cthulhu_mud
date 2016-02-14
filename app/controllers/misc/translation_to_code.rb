module Misc::TranslationToCode

  def translation_to_code( params )
    code = params[ :default_translation ]
    code = 'i' + code if code[0] =~ /\d/
    code = code.downcase.gsub( /[^a-z0-9]/, '_' )
    params[ :code ] = code
    params
  end

end