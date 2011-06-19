require 'rubygems'
require 'sinatra'

require 'haml'

configure :production do
  require 'newrelic_rpm'
end

before do
  response.headers['Cache-Control'] = 'public, max-age=31557600'
end

get '/' do
  @loc = 'application'

  haml :application
end

get '/download/?' do
  haml :download
end

get '/app/download/?' do
  redirect '/download'
end

get '/app/sparkle/?' do
  redirect 'http://sparkler.getcloudapp.com/feed.xml'
end

get '/start/?' do
  redirect '/'
end

get '/blog/?' do
  redirect 'http://blog.getcloudapp.com'
end

get '/blog/feed/?' do
  redirect 'http://blog.getcloudapp.com/feed.xml'
end

get '/blog/:permalink' do
  permalink = params[:permalink].gsub(/_/, '-')

  redirect "http://blog.getcloudapp.com/article/#{ permalink }"
end

get '/terms/?' do
  haml :terms
end

get '/privacy/?' do
  haml :privacy
end
