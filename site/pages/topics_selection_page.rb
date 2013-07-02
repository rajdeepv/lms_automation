class TopicSelectionPage < Page

  def select_topic topic_name
    driver.find_element(:xpath, "//li//p[.='#{topic_name}']/../../input").click
  end

  def add_and_continue
    driver.find_element(:link_text => "Add and Continue").click

  end

end