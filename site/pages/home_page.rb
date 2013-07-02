class HomePage < Page

  def logged_in_username
    driver.find_element(:class => "tmplLoggedInAs").text
  end

  def go_to_admin_page
    driver.find_element(:css => "#adminTabLink a").click
  end

  def log_out
    driver.find_element(:link_text => "Log Out").click
  end

end