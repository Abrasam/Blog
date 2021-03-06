require 'toto'

# Rack config
use Rack::Static, :urls => ['/css', '/js', '/images', '/videos', '/favicon.png'], :root => 'public'
use Rack::CommonLogger

if ENV['RACK_ENV'] == 'development'
  use Rack::ShowExceptions
end

#
# Create and configure a toto instance
#
toto = Toto::Server.new do
  #
  # Add your settings here
  # set [:setting], [value]
  # 
   set :author,    "sam sully"                                # blog author
   set :title,     "sam's dev blog"                           # site title
  # set :root,      "index"                                   # page to load on /
  # set :date,      lambda {|now| now.strftime("%d/%m/%Y") }  # date format for articles
  # set :markdown,  :smart                                    # use markdown + smart-mode
  # set :disqus,    false                                     # disqus id, or false
  # set :summary,   :max => 150, :delim => /~/                # length of article summary and delimiter
  # set :ext,       'txt'                                     # file extension for articles
  # set :cache,      28800                                    # cache duration, in seconds
  set :url, "https://samsga.me/blog"
   set :prefix, "blog/"

  set :date, lambda {|now| now.strftime("%B #{now.day.ordinal} %Y") }
end

run toto
