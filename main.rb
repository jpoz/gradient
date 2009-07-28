require 'rubygems'
require 'sinatra'
require 'png_gradient'

###   MAIN PAGES   ###

get '/' do
  @color1 = "afdeda"
  @color2 = "949494"
  haml :index
end

get %r{^/(\d{1,3})/(\d{1,3})/([0-9A-Fa-f]{6,6})/([0-9A-Fa-f]{6,6})/output.(\w+)$} do |height, width, color1, color2, type|
  case type
  when "png"
    headers 'Content-Type' => 'image/png'
    png_gradient = PNGGradient.new(width.to_i, height.to_i, "##{color1}", "##{color2}")
    png_gradient.to_blob()
  when "html"
    @height, @width, @color1, @color2 = height, width, color1, color2
    haml :png, :layout => false
  else
    haml :'404'
  end
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
