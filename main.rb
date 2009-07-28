require 'rubygems'
require 'sinatra'

###   MAIN PAGES   ###

get '/' do
  "HELLO!!!"
end

### STATIC / ERROR ###

set :sass, {:style => :compact } # default Sass style is :nested
get '/stylesheet.css' do
  header 'Content-Type' => 'text/css; charset=utf-8'
  sass :stylesheet
end

not_found do
  haml :'404'
end

error do
  'Sorry there was a nasty error - ' + env['sinatra.error']
end
