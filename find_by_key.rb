require 'yaml'

label = ARGV[0]

translations_strings = {
    :ge => YAML.load_file('./locales/de.yml')['de'],
    :en => YAML.load_file('./locales/en.yml')['en'],
    :uk => YAML.load_file('./locales/en-GB.yml')['en-GB'],
    :es => YAML.load_file('./locales/es.yml')['es'],
    :fr => YAML.load_file('./locales/fr.yml')['fr'],
    :it => YAML.load_file('./locales/it.yml')['it'],
    :ru => YAML.load_file('./locales/ru.yml')['ru']
}

translations_strings.each do |k, v|
  puts "#{k} - #{v[label]}"
end
