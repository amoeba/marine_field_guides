# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format 
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end


ActiveSupport::Inflector.inflections do |inflection|
  inflection.singular /(SimilarSpecies)/i, '\1'
  inflection.uncountable 'species', 'similar_species', 'distinguishing_characters'
end   