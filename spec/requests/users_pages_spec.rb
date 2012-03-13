require 'spec_helper'

describe "UsersPages" do
  subject { page }

  describe "sign up page" do

    before { visit register_path }

    describe "register with invalid information" do
      it "should not create a user" do
        expect { click_button "Register" }.not_to change(User, :count)
      end
    end

    describe "register with valid information" do

      before(:each) do
        visit register_path
      end

      before do
        fill_in "Name",         with: "Test User"
        fill_in "Username",     with: "Ickle"
        fill_in "Email",        with: "test@example.com"
        fill_in "Password",     with: "Foobar13"
        fill_in "Confirmation", with: "Foobar13"
      end
      
      it "should create a user" do
        expect { click_button "Register" }.to change(User, :count).by(1)
      end
    end
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',     text: user.username) }
    it { should have_selector('title',  text: user.username) }
  end
end
