require("sinatra")
require("pry-byebug")
require_relative("models/rpsls")

get '/' do
  @welcome = ["Just click on a choice, the computer will pick too, and we'll see who wins!","Powered by Ruby and Sinatra."]
    erb(:welcome)
  end

get '/:choice' do
  choice = params[:choice].to_s
  @result = RPSLS.game(choice)
  erb(:result)
end

