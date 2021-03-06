# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  username        :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#

require 'spec_helper'

describe User do

  before { @user = User.new(name: "Test", username: "Ickle", email: "test@example.com",
                            password: "Foobar13", password_confirmation: "Foobar13") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }

    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @user.name = 'a' * 41 }

    it { should_not be_valid }
  end

  describe "when username is not present" do
    before { @user.username = " " }

    it { should_not be_valid }
  end

  describe "when username is too long" do
    before { @user.username = 'a' * 41 }

    it { should_not be_valid }
  end

  describe "when username is already in use" do
    before do
      duplicate_user = @user.dup
      duplicate_user.save
    end

    it { should_not be_valid }
  end
  
  describe "when email is not present" do
    before { @user.email = " " }

    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    invalid_addresses = %w[ user@foo,com user_at_foo.org example.user@foo. ]
    invalid_addresses.each do |invalid_address|
      before { @user.email = invalid_address }
      it { should_not be_valid }
    end
  end

  describe "when email format is valid" do
    valid_addresses = %w[ user@foo.com USER_B@FOO.com user.name@foo.co.nz c+w@git.cn ]
    valid_addresses.each do |valid_address|
      before { @user.email = valid_address }
      it { should be_valid }
    end
  end

  describe "when email is already in use" do
    before do
      duplicate_user = @user.dup
      duplicate_user.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = ' ' }
    it { should_not be_valid }
  end

  describe "when passwords don't match" do
    before { @user.password_confirmation = "missmatch" }
    it { should_not be_valid }
  end

  describe "when password is too short" do
    before { @user.password = 'a' * 7 }
    it { should_not be_valid }
  end

  describe "return value of authentication method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:invalid_password_user) { found_user.authenticate("invalid") }

      it { should_not == invalid_password_user }
      specify { invalid_password_user.should be_false }
    end
  end
end
