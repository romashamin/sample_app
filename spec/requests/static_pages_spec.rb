require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }
    it { should have_content('Sample App') }
  end

  describe "Help page" do
    before { visit help_path }
    it { should have_title('Help') }
  end

  describe "About page" do
    before {visit about_path}
    it { should have_title('About Us') }
  end
end