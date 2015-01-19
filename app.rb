require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')
require('./lib/phone_number')
require('./lib/name')

get('/') do
  @all_contacts = Contact.all_contacts()
  erb(:index)
end

post('/contact') do
  name = params.fetch('contact_names')
  Contact.new({ contact_names: name, contact_phone_numbers: "123-456-7890" }).save()
  @all_contacts = Contact.all_contacts()
  erb(:index)
end
