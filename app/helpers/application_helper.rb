module ApplicationHelper
  def current_year
    Date.today.year
  end

  def link_to_github(author, repo)
    link_to 'Project: TestGuru,', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_message(type)
    content_tag :p, flash[type], class: "flash #{type}" if flash[type]
  end
end
