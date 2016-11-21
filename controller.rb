require ("sinatra")

get '/' do
  @welcome = "Welcome to my website. Here you can play rock paper lizard spock. In the URL bar. Yep."
  erb(:welcome)
end 