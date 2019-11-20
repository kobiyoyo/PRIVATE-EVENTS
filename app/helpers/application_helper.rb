module ApplicationHelper
  def full_title(page_title = '')
    page_title == '' ? "Event" : "#{page_title} | Event"
  end
end
