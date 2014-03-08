# -*- coding: utf-8 -*-
require 'spec_helper'

describe "StaticPages" do
  describe "help page" do
    it "should have the content 'help'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/help'
      page.should have_content('help')
    end
  end
end
