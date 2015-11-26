require 'rails_helper'


  context "user signed in on the homepage" do


    it "should see 'sign out' link" do
      sign_up
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign up' link" do
      sign_up
      visit '/restaurants'
      expect(page).not_to have_link('Sign up')
    end
  end
