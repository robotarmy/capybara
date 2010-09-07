require File.expand_path('spec_helper', File.dirname(__FILE__))

require 'capybara'

describe Capybara do
  
  describe 'default_wait_time' do
    after do
      Capybara.default_wait_time = 2
    end
    
    it "should be changeable" do
      Capybara.default_wait_time = 5
      Capybara.default_wait_time.should == 5
    end
  end

  describe '.register_driver' do
    it "should add a new driver" do
      Capybara.register_driver :schmoo do |app|
        Capybara::Driver::RackTest.new(app)
      end
      session = Capybara::Session.new(:schmoo, TestApp)
      session.visit('/')
      session.body.should include("Hello world!")
    end
  end
  
end
