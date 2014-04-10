require 'spec_helper'

describe FoodController do

  describe "Four Square Net request" do
    let(:res) { four_sq_request(:food) }

    it "should return a Hash" do
      expect(res).to be_an_instance_of(Hash)
    end

    it "should have the proper structure" do
      expect(res.keys).to include(:groups)
    end

  end

  describe "parse_response" do
    it "should return a venue" do
      res = parse_response(:food)
      expect(res.keys).to include(:name,:location,:hours)
    end
  end

  describe "get_a_venue" do
    it "should return a venue" do
      venue = get_a_venue(:food)
      expect(venue[:name]).to be_an_instance_of(String)
    end
  end
end
