class LoginPage < Page

  def set_username username
    driver.find_element(:id, "lgUsername").send_keys username
  end

  def set_password password
    driver.find_element(:id, "lgPassword").send_keys password
  end

  def click_login
    driver.find_element(:id, "id4").click
  end

  def sign_in_as username, password
    set_username username
    set_password password
    click_login
  end

end