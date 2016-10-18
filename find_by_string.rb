require 'yaml'
require 'colorize'

language = ARGV[0]
label = ARGV[1]

translations_strings = {
    :ge => YAML.load_file('./locales/de.yml')['de'],
    :en => YAML.load_file('./locales/en.yml')['en'],
    :uk => YAML.load_file('./locales/en-GB.yml')['en-GB'],
    :es => YAML.load_file('./locales/es.yml')['es'],
    :fr => YAML.load_file('./locales/fr.yml')['fr'],
    :it => YAML.load_file('./locales/it.yml')['it'],
    :ru => YAML.load_file('./locales/ru.yml')['ru']
}

@array = []

config_options = YAML.load_file('./locales/' + "#{language}" + '.yml')[language]
config_options.each do |key, value|
    if value.include?(label)
      @array.push(key)
    end
end

puts "----------------------------------------------------------------------------\n" +
"                                 Found keys: #{@array.count}" +
"\n----------------------------------------------------------------------------"
@array.each {|x| print x.bold, "\n" }

translations_strings.each do |key, value|
  language_names = {
      ge: 'German',
      en: 'English',
      uk: 'English UK',
      es: 'Spanish',
      fr: 'French',
      it: 'Italian',
      ru: 'Russian'
  }
  language = language_names[:"#{key}"]
  puts "----------------------------------------------------------------------------\n
                                 #{language.upcase.green.bold}\n
----------------------------------------------------------------------------\n"
  @array.each { |x| puts "| #{x.green} | - #{value[x]}" }
  puts "----------------------------------------------------------------------------\n\n"
end
