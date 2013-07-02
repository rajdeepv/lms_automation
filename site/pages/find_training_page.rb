class FindTrainingPage < Page

  def search_for about, category, version, type = "Course"
    driver.find_element(:id => "ftSearchField").send_keys(about)
    select_from_dropdown({:id=>"ftSearchType"},type)
    select_from_dropdown({:id => "ftCategory"}, category)
    wait_for_version_dropdown_to_load
    select_from_dropdown({:id => "ftVersion"}, version)
    driver.find_element(:name => "search").click
  end

  def wait_for_version_dropdown_to_load
    wait.until{driver.find_element({:id => "ftVersion"}).find_element(:tag_name => "option").text != "Select One"}
  end

  def course_present? course_name
    true if driver.find_elements(:xpath, "//a[@class='courseLink'][contains(text(),'#{course_name}')]").size >= 1
  end

  def select_course course_name
    driver.find_element(:xpath, "//a[@class='courseLink'][contains(text(),'#{course_name}')]").click
    switch_to_last_window
  end

end