require 'rubygems'
require 'sinatra'
require 'png_gradient'

###   MAIN PAGES   ###

get '/:width/:height/:color1/:color2/output.png' do
  header 'Content-Type' => 'image/png'
  png_gradient = PNGGradient.new(params[:width].to_i, params[:height].to_i, "##{params[:color1]}", "##{params[:color2]}")
  png_gradient.to_blob()
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
