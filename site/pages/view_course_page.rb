class ViewCoursePage < Page

  def select_topic name
    driver.find_element(:link_text => "#{name}").click
  end

  def get_bold_text
    driver.switch_to.frame("contentframe")
    driver.find_element(:xpath , "//div[@id='editor2']//b").text
  end

  def close_window
    driver.close
    switch_to_main_window
  end

end