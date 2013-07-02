class Page
  attr_accessor :driver

  def initialize driver
    @driver = driver
  end

  def wait
    Selenium::WebDriver::Wait.new(:timeout => 40)
  end

  def select_from_dropdown(locator, text)
    dropdown = driver.find_element(locator)
    options = dropdown.find_elements(:tag_name => "option")
    options.each do |g|
      if g.text == text
        g.click
        break
      end
    end
  end

  def retry_until(max_trials = 3, time = 3)
    success = false
    trial_number = 1
    until (success || trial_number > max_trials) do
      begin
        if yield
          success = true
          break
        end
      rescue
        trial_number+=1
        sleep time
      end
    end

    if success
      puts "succeeded in #{trial_number} trials"
    else
      puts "Holy crap! I am tired now!"
    end
  end

  def text_selection_script(element_id, start_index, end_index)
    script = "var range = document.createRange();" +
        "var start = document.getElementById('"+element_id+ "');" +
        "var textNode = start.getElementsByTagName('p')[0].firstChild;" +
        "range.setStart(textNode, #{start_index.to_s});" +
        "range.setEnd(textNode, #{end_index.to_s});" +
        "window.getSelection().addRange(range);"
  end

  def switch_to_last_window
    driver.switch_to.window (driver.window_handles.last)
  end

  def alert_present?
    driver.switch_to.alert rescue false
  end

  def switch_to_main_window
    driver.switch_to.window (driver.window_handles.first)
    sleep 4
  end


end