def page_name(heading) 

  it { should have_selector('title', text: full_title(heading)) }
  it { should have_selector('h1', text: heading) }

end

def full_title(curr_page)

  base_title = "cw42143977 Blog"

  if curr_page.empty?
    base_title
  else
    "#{base_title} | #{curr_page}"
  end

end

def nav_links

  it { should have_link('Home',     href: root_path) }
  it { should have_link('About',    href: about_path) }
  it { should have_link('Contact',  href: contact_path) }
  it { should have_link('Help',     href: help_path) }
  it { should have_link('Sign in',  href: '#') }
  it { should have_link('Heroku',   href: 'http://www.heroku.com') }

end
