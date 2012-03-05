module PagesHelper

  def full_title(curr_page)
    base_title = "cw42143977 Blog"

    if curr_page.empty?
      base_title
    else
      "#{base_title} | #{curr_page}"
    end
  end

  def full_heading(curr_page)

    if curr_page.empty?
      "Craigs Blog"
    else
      "#{curr_page}"
    end
  end

end
