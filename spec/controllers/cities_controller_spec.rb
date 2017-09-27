require 'rails_helper'
require 'spec_helper'

RSpec.describe CitiesController, type: :controller do
    
    def sign_in_as_an_admin
        # ASk factory girl to generate a valid user for us.
        @user ||= FactoryGirl.create :user
        @user.add_role :admin

        # We action the login request using the parameters before we begin.
        # The login requests will match these to the user we just created in the factory, and authenticate us.
        
        sign_in @user
        # post user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
    end
    
    describe 'GET#index' do
        # before do
            
            # binding.pry
        # end
        it "should gives list of all cities when admin login" do
            
            city = FactoryGirl.create_list(:city,25)
            
            sign_in_as_an_admin
            get 'index'
            
            
            # binding.pry
            expect(response).to be_success
            expect(response).to render_template("index")
            expect(assigns(:cities)).to match_array(city)
            
            
            
        end
        
        it "should restric access when no admin" do
            
            city = FactoryGirl.create_list(:city,25)
            
            # sign_in_as_an_admin
            get 'index'
            
            
            # binding.pry
            expect(response).not_to render_template("index")
            expect(response).not_to be_success
            
            # expect(assigns(:cities)).to match_array(city)
            
            
            
        end
    end
    
    describe 'GET#show' do
        
    end

end
