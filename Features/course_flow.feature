#1.	Open https://precisionlmstest.ptc.com/.
#2.	Login using a valid user. – Content Administrator – Will provide the user  details in a separate email. a. Prof_verify_manager@ptcunoemail.com
#b. Password :prof7763
#3.	Verify you are successfully logged in
#4.	Go to Administration Tab
#5.	Click Create & Edit Courses/Assessments
#6.	Click Create Course
#7.	Start by selecting existing content
#8.	From the overlay (Learning Item Selection Utility)
#a.	Select Category – Windchill PDM Link 10.1
#b.	Version – 10.1
#c.	Click Search
#9.	Enter “Change Management with Windchill PDMLink 10.1” in Find Text area
#10.	Select the course
#11.	Click OK
#12.	Select a few topics
#a.	Introduction
#b.	Course Overview
#c.	Introduction to the change Process
#13.	Click “Add and Continue”
#14.	Go to Topic tab on the right side of the content
#a.	Give a title to the course (Example : Your Name)
#b.	Give a description
#c.	Click Apply
#15.	Now On the left Select the Introduction topic or any topic
#16.	It will ask you for Accepting the License Agreement. Accept it.
#17.	If it does not ask for agreement. Then proceed further.

#a.	On the right hand side content, click on any content
#b.	Verify the toolbar is disabled
#18.	Select a course overview topic
#a.	On the right hand side content, click on any content
#b.	Verify the toolbar is enabled
#c.	Select some text on the content.
#d.	Click B, I or U icons to Bold, Italicize and Underline the content
#e.	Verify the content is changed as expected.
#19.	Click on Insert on top left.
#a.	Click New topic from the drop down
#b.	Select the Rich Media type of topic
#c.	Click Ok
#d.	Go to the topic tab and give the topic a name (Example : Rich Media)
#e.	Upload a rich media content
#20.	Save and Close the course
#21.	Verify the course appears on the development tab
#22.	Click on Release the course link on development tab.. the link would be  promote.
#23.	Verify the course on the Release Tab
#24.	Go to Find Training tab
#25.	Search the course created with appropriate category, version and text of the  course.
#26.	Verify the course exists.
#27.	Launch the course by clicking on the link
#28.	Verify the modifications made are available.
#29.	Click on Logout link.
#30.	Close the browser.

Feature:

  Scenario:
    Given I am logged into plmtest as user "Prof_verify_manager@ptcunoemail.com"
    When I go to administration tab
    And I Click Create & Edit Courses/Assessments
    And I click on create course
    And I start selecting existing content
    And I search for "Change Management with Windchill PDMLink 10.1" with category "Windchill PDMLink" and version "10.1"
    And I select the course as "Change Management with Windchill PDMLink 10.1"
    And I select and continue with the following topics:
      | Introduction                       |
      | Course Overview                    |
      | Introduction to the Change Process |
    And I change title to "Test PDMLink 10.1" and Description to "Test_description"
    When I select "Introduction" topic for editing
    Then I should not be able to edit the text
    And I select "Course Overview" topic for editing
    And I edit some text as bold
    Then I should see the edited text in bold
    When I Insert a new topic of type rich media
    And I save and close my course
    Then I should see my course under Development tab
    When I release the course
    And I go to Released tab
    Then I should see my course under Release tab
    When I go to find training tab
    And I search for above course with category  "Windchill PDMLink" and version "10.1"
    Then I should be able to see my course there
    When I select the above course
    And I select "Course Overview" topic for viewing
    Then I should see previously edited text in bold
    When I close the view course window
    And I logout



