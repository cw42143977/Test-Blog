require 'spec_helper'

describe 'Pages' do

  subject { page }

  describe 'Home Page' do

    heading = "Home"
    before { visit root_path }

    page_name(heading)
    nav_links()

  end

  describe 'About Page' do

    heading = "About"
    before { visit about_path }

    page_name(heading)

  end

  describe 'Contact Page' do

    heading = "Contact"
    before { visit contact_path }

    page_name(heading)
    nav_links()

  end

  describe 'Help Page' do

    heading = "Help"
    before { visit help_path }

    page_name(heading)
    nav_links()

  end

end
