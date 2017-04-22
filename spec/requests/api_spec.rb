require 'rails_helper'
require 'net/http'

describe 'Cwtchat Tests' do
  
  describe 'GET Translated Messages' do
    it 'should respond with a OK status' do
      uri = URI("http://api.funtranslations.com/translate/yoda.json?text=#{URI.encode("Test String")}")
      response = JSON.parse(Net::HTTP.get(uri))
      expect((response['contents']).length).to eq(3) 
    end
  end

end