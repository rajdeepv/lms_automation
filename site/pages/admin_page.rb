class AdminPage < Page

  def create_edit_cources
    driver.find_element(:link_text, "Create & Edit Courses/Assessments").click
  end

  def create_course
    driver.find_element(:link_text => "Create Course").click
  end

  def start_by_selecting_contents
    switch_to_pop_up
    driver.find_element(:link_text => "Start by selecting content").click
    wait.until { driver.find_element(:id => "_wicket_window_16") }
    driver.switch_to.frame("_wicket_window_16")
  end

  def search_for name, category, version
    select_from_dropdown({:id => "library"}, category)
    select_from_dropdown({:id => "version"}, version)
    driver.find_element(:name => "searchPanel:searchKeyword").send_keys(name)
    driver.find_element(:link_text => "Search").click
  end

  def select_course course_name
    wait_for_results_to_appear
    driver.find_elements(:css, "div.input.radio").find { |e| e.text == course_name }.find_element(:tag_name => "input").click
    driver.find_element(:link_text => "OK").click
    switch_to_last_window
    wait.until { driver.find_element(:link_text => "Add and Continue") }
  end

  def wait_for_results_to_appear
    wait.until { driver.find_element(:css, "div.input.radio") }
  end

  def latest_course_row_text
    driver.find_element(:xpath, "//tbody/tr").text
  end

  def promote_latest_course_row type
    driver.find_element(:xpath, "//tbody/tr//img[@title = 'Promote']").click
    switch_to_pop_up
    driver.find_element(:xpath, "//label[.='#{type}']/../input").click
    wait.until { driver.find_element(:id => "userlaunchable").enabled? }
    driver.find_element(:link_text => "Save").click
    driver.switch_to.alert.accept
  end

  def select_released_tab
    retry_until(10, 5) do
      driver.find_element(:link_text => "Released").click
      driver.find_element(:xpath, "//li[@class='tab1 selected']")
    end
  end

  def select_find_training
    driver.find_element(:link_text => "Find Training").click
  end

  def switch_to_pop_up
    wait.until { driver.find_element(:id => "_wicket_window_3") }
    driver.switch_to.frame("_wicket_window_3")
  end


end