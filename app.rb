require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    obj = PigLatinizer.new
    @results = obj.piglatinize(params[:user_phrase])

    erb :piglatinize
  end
end
