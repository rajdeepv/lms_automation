require_relative 'pages/page.rb'

pages_location = File.expand_path(File.join(File.dirname(__FILE__), '/pages/*.rb'))
Dir["#{pages_location}"].each { |file| require file }


class Plms
  attr_accessor :base_url, :driver

  def initialize
    base_url= "https://precisionlmstest.ptc.com/"
    @driver = Selenium::WebDriver.for "firefox".to_sym
    @driver.manage.timeouts.implicit_wait = 15
    launch_site base_url
  end

  def launch_site base_url
    @driver.get base_url
    wait = Selenium::WebDriver::Wait.new(:timeout => 30)
    wait.until { @driver.find_element(:id => "id4") }
  end

  def close
    @driver.quit
  end

  def login_page
    @login_page ||= LoginPage.new @driver
  end

  def home_page
    @home_page ||= HomePage.new @driver
  end

  def admin_page
    @admin_page ||= AdminPage.new @driver
  end

  def view_course_page
    @view_course_page ||= ViewCoursePage.new @driver
  end

  def topic_selection_page
    @topic_selection_page ||= TopicSelectionPage.new @driver
  end

  def course_designer_page
    @course_designer_page ||= CourseDesignerPage.new @driver
  end

  def find_training_page
    @find_training_page ||= FindTrainingPage.new @driver
  end


end