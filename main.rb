require 'rubygems'
require 'sinatra'
require 'png_gradient'

###   MAIN PAGES   ###

get '/' do
  @color1 = "00FF00"
  @color2 = "FF00FF"
  haml :index
end

get %r{/(\d*)/(\d*)/(\w*)/(\w*)/output.png} do |height, width, color1, color2|
  headers 'Content-Type' => 'image/png'
  png_gradient = PNGGradient.new(width.to_i, height.to_i, "##{color1}", "##{color2}")
  png_gradient.to_blob()
end

get %r{/(\d*)/(\d*)/(\w*)/(\w*)/output.html} do |height, width, color1, color2|
  @height, @width, @color1, @color2 = height, width, color1, color2
  haml :png, :layout => false
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
  'AHHHHHHHHH - ' + env['sinatra.error']
end
