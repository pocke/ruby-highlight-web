require 'sinatra'
require 'iro'

set :public_folder, File.join(__dir__, 'static')
set :erb, format: :html5

get '/' do
  erb :'index.html'
end

post '/highlight' do
  request.body.rewind
  source = request.body.read
  highlight = Iro::Ruby::Parser.tokens(source)
  Iro::Formatter::HTMLFormatter.format(source, highlight, prefix: 'ruby-')
end
