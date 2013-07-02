class CourseDesignerPage < Page

  def change_title_and_desc_to title, description
    wait.until { driver.find_element(:id => "learningTitle") }
    title_box = driver.find_element(:id => "learningTitle")
    title_box.clear
    title_box.send_keys title
    desc = driver.find_element(:id => "learningDescription")
    desc.clear
    desc.send_keys description
    driver.find_element(:link_text => 'Apply').click
  end

  def select_topic topic
    sleep 3
    driver.find_element(:link_text => topic).click
    handle_agreement_terms
    if topic == "Course Overview"
      driver.switch_to.alert.dismiss
      driver.find_element(:link_text => topic).click
    end
  end

  def is_content_non_editable?
    driver.find_elements(:class => "noEditingMessaging").size == 1
  end

  def handle_agreement_terms
    if driver.find_elements(:id => "_wicket_window_3").size == 1
      driver.switch_to.frame("_wicket_window_3")
      driver.find_element(:link_text => "I Accept").click
    end
  end

  def select_text_from_index (start_index, end_index)
    wait.until {driver.find_elements(:xpath, "//li[@id='fontSizeGroup'][text() = 'Style']").count == 0 }
    switch_to_editor_frame
    driver.find_element(:xpath, "//p[contains(text() , 'This course constitutes')]").click
    driver.execute_script(text_selection_script("editor2", start_index, end_index))
    selected_text = driver.find_element(:id => "editor2").text[start_index..end_index-1]
  end

  def make_selection_bold
    driver.switch_to.default_content
    driver.find_element(:id => "editor-toolbar-bold").click
    switch_to_editor_frame
  end

  def switch_to_editor_frame
    driver.switch_to.frame("iframe-editor")
  end

  def find_bold_text_in_editor
    driver.find_element(:id => "editor2").find_element(:tag_name => "b").text
  end

  def go_to_insert_menu_item_new_topic
    driver.switch_to.default_content
    element = driver.find_element(:xpath, "//li[@class='customTopicContent']/a")
    driver.execute_script("arguments[0].click()", element)
  end

  def select_topic_template type
    driver.find_element(:xpath, "//label[.='#{type}']/../input").click
    driver.find_element(:link_text => "OK").click
  end

  def add_media
    wait.until{driver.find_elements(:xpath => "//li[@class = 'insertRichMedia inactiveAction']").size == 0}
    driver.find_element(:id => "editor-toolbar-movie").click
    media_location = File.expand_path(File.join(File.dirname(__FILE__), '/../../data/test.mp4'))
    puts media_location
    driver.switch_to.frame("iframe-editor")
    wait.until{driver.find_element(:id => "insertVideo").displayed?}
    driver.find_element(:id => "insertVideo").send_keys media_location
    driver.find_element(:id => "editorMediaSubmit").click
  end

  def save_and_close
    driver.switch_to.default_content
    driver.find_element(:link_text => "Save & Close").click
    switch_to_main_window
    wait.until { driver.title.downcase.start_with? "create" }
  end

end