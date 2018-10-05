require 'spec_helper'

context "As a student" do
  context "Viewing a course overview" do
    context 'Course Navigation' do
      it 'I can navigate Home'
      it 'I can navigate to the Syllabus'
      it 'I can navigate to Discussions'
      it 'I can navigate to Grades'
    end
    it 'I can see the Course Header Image'
    it 'I can see modules listed'
    it 'I can see modules items listed'

    context "Units (aka Modules)" do
      it "I can see the title"
      it "I can see the requirements"
      it "I can see the progress bar"
      it "I can expand and collapse sections"
      it "I see in progress units expanded"
      it "I see unstarted units collapsed"
      it "I see the 'View' requirement satisfied when I view an item"
      it "I see the 'Mark as done' requirement satisfied when I finish it"
    end

    context "Items (AKA lessons/activities)" do
      it "I can see the title"
      it "I can see the reqirements"
      it "I can see the points"
      it "I can click on all items"
    end

    context "Lessons (AKA Text Headers)" do
      it 'I can collapse and expand them'
      it 'I can see the status (not started, in progress, complete/Overdue)'
      it "I can see First in progress lesson expanded"
      it 'I can see all other items collapsed'
      it "I can't expand or collapse any other types"
    end

    it 'I can click on "Coming Up"'
    it 'I can click on "View Calendar"'
    it 'i can click on "Recent Feedback"'
    it "I can click on the view course stream button"
    it "I can see a breadcrumb"
  end
end
