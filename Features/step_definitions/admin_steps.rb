When /^I Click Create & Edit Courses\/Assessments$/ do
  @plms.admin_page.create_edit_cources
end

When /^I click on create course$/ do
  @plms.admin_page.create_course
end

When /^I start selecting existing content$/ do
  @plms.admin_page.start_by_selecting_contents
end
When /^I search for "([^"]*)" with category "([^"]*)" and version "([^"]*)"$/ do |name, category, version|
  @plms.admin_page.search_for(name,category,version)
end

When /^I select the course as "([^"]*)"$/ do |course_name|
  @plms.admin_page.select_course course_name
end

When /^I select and continue with the following topics:$/ do |table|
  table.raw.each do |topic|
    @plms.topic_selection_page.select_topic(topic.first)
  end
  @plms.topic_selection_page.add_and_continue
end

When /^I change title to "([^"]*)" and Description to "([^"]*)"$/ do |title, description|
  @title = title
  @plms.course_designer_page.change_title_and_desc_to title, description
end

When /^I select "([^"]*)" topic for editing$/ do |topic|
  @plms.course_designer_page.select_topic topic
end

Then /^I should not be able to edit the text$/ do
  @plms.course_designer_page.is_content_non_editable?.should be_true
end

When /^I edit some text as bold$/ do
  @selected_text = @plms.course_designer_page.select_text_from_index(5,23)
  @plms.course_designer_page.make_selection_bold
end

Then /^I should see the edited text in bold$/ do
  @plms.course_designer_page.find_bold_text_in_editor.should eq @selected_text
end

When /^I Insert a new topic of type rich media$/ do
  @plms.course_designer_page.go_to_insert_menu_item_new_topic
  @plms.course_designer_page.select_topic_template "Rich Media"
  @plms.course_designer_page.add_media
end

When /^I save and close my course$/ do
  @plms.course_designer_page.save_and_close
end

Then /^I should see my course under Development tab$/ do
  @plms.admin_page.latest_course_row_text.should include @title
end

When /^I release the course$/ do
  @plms.admin_page.promote_latest_course_row "Released"
end

When /^I go to Released tab$/ do
  @plms.admin_page.select_released_tab
end
Then /^I should see my course under Release tab$/ do
  @plms.admin_page.latest_course_row_text.should include @title
end

When /^I go to find training tab$/ do
  @plms.admin_page.select_find_training
end

When /^I search for above course with category  "([^"]*)" and version "([^"]*)"$/ do |category, version|
  @plms.find_training_page.search_for @title,category,version
end

Then /^I should be able to see my course there$/ do
  @plms.find_training_page.course_present?(@title).should be_true
end

When /^I select the above course$/ do
  @plms.find_training_page.select_course(@title)
end

When /^I select "([^"]*)" topic for viewing$/ do |topic|
  @plms.view_course_page.select_topic(topic)
end

Then /^I should see previously edited text in bold$/ do
  @plms.view_course_page.get_bold_text.should eq @selected_text
end

When /^I close the view course window$/ do
  @plms.view_course_page.close_window
end