require 'spec_helper'

context "As a student" do
  context "Navigating" do
    context "The main nav" do
      it 'I can click on the dashboard'
      it 'I can click on my courses'
      it 'I can click on my calender'
      it 'I can click on my inbox'
    end

    context "The right sidebar" do
      context "Todo" do
        it 'I can click on items in the to do section'
        it 'I can dismiss to do items'
      end

      it "I can click on Coming up items"
      it "I can click on Recent feedback items"
    end

    context "Top Navigation" do
      it 'I can see the account dropdown'
    end
  end
end
