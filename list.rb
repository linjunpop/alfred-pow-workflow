require 'rexml/document'
doc = REXML::Document.new

Dir.chdir(File.expand_path('~/.pow'))
app_list = Dir.glob('*')

items = doc.add_element 'items'

app_list.select { |app|
  app.match "#{ARGV[0]}"
}.each do |app|
  item = items.add_element('item', {'uid' => app, 'arg' => app})
  item.add_element('title').add_text(app)
  item.add_element('subtitle').add_text("http://#{app}.dev")
  item.add_element('icon', {'type' => ''})
end

puts doc.to_s

