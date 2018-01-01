require 'rails_helper'

RSpec.describe KeywordsController, type: :controller do
  let(:user) {Fabricate(:user)}

  describe "GET #index" do
  	it "blocks unauthenticated access" do      
      sign_out user

      get :index

      expect(response).to redirect_to(new_user_session_path)
    end

    it "allow authenticated access" do      
      sign_in user

      get :index

      expect(response).to be_success
    end

    it "allow authenticated access to pdf file" do      
      sign_in user

      get :index, format: :pdf

      expect(response).to be_success
    end
  end

  describe "POST #import" do
  	it "uploaded correct csv file" do
  	  sign_in user

  	  csv_file = fixture_file_upload('files/sample.csv','text/csv')
  	  post :import, params:{ file: csv_file }

  	  csv_file.read != nil

  	  expect(flash[:success]).to eq "Uploaded Successfuly!"
      expect(response).to redirect_to(keywords_path)
  	end

  	it "uploaded incorrect csv file" do
  	  sign_in user

  	  post :import, params:{}

      expect(flash[:alert]).to eq "Can't read CSV file or it's empty"
  	end

  end
end
