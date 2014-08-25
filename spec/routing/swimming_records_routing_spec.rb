require "rspec-rails"

RSpec.describe SwimmingRecordsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/swimming_records").to route_to("swimming_records#index")
    end

    it "routes to #new" do
      expect(:get => "/swimming_records/new").to route_to("swimming_records#new")
    end


    it "routes to #update_system" do
      expect(:get => "/swimming_records/update_system").to route_to("swimming_records#update_system")
    end

    it "routes to #create" do
      expect(:post => "/swimming_records").to route_to("swimming_records#create")
    end

    it "routes to #import_times" do
      expect(:post => "/swimming_records/import_times").to route_to("swimming_records#import_times")
    end

    # it "routes to #update" do
    #   expect(:put => "/swimming_records/1").to route_to("swimming_records#update", :id => "1")
    # end

    it "routes to #destroy" do
      expect(:delete => "/swimming_records/1").to route_to("swimming_records#destroy", :id => "1")
    end

  end
end
