require_relative 'config/environment'
require_relative 'models/piglatinizer'
require 'pry'

class App < Sinatra::Base

    get '/' do

        erb :user_input
    end

    post '/piglatinize' do  
        pl = PigLatinizer.new
        @pig_latin_converted_word = pl.piglatinize(params[:user_phrase])
        #binding.pry
        erb :converted
    end
end