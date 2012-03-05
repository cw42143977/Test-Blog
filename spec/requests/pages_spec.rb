require 'spec_helper'

describe 'Pages' do

  subject { page }

  describe 'Home Page' do

    before { visit root_path }

    it { should have_selector('title', text: full_title('Home')) }
    it { should have_selector('h1', text: 'Home Page') }

  end

  describe 'About Page' do

    before { visit about_path }

    it { should have_selector('title', text: full_title('About')) }
    it { should have_selector('h1', text: 'About Page') }

  end

  describe 'Contact Page' do

    before { visit contact_path }

    it { should have_selector('title', text: full_title('Contact')) }
    it { should have_selector('h1', text: 'Contact Page') }

  end

  describe 'Help Page' do

    before { visit help_path }

    it { should have_selector('title', text: full_title('Help')) }
    it { should have_selector('h1', text: 'Help Page') }

  end

end
