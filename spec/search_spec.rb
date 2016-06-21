require_relative './spec_helper'

RSpec.describe Rhymba::Client, :vcr do
  describe :search do
    describe :album do
      it "without arguments" do
        expect{valid_client.search_album}.to raise_error ArgumentError
      end

      it "without argument(format)" do
        expect{valid_client.search_album("$top" => "4",:keyword => "rick springfield","$select" => "id,name,artist_name")}.to raise_error ArgumentError
      end
      
      it "without argument(top)" do
        expect{valid_client.search_album("$format" => "json",:keyword => "rick springfield","$select" => "id,name,artist_name")}.to raise_error ArgumentError
      end

      it "without argument(select)" do
        expect{valid_client.search_album("$format" => "json","$top" => "4",:keyword => "rick springfield")}.to raise_error ArgumentError
      end

      it "with valid arguments" do
        expect(
          valid_client.search_album("$format" => "json","$top" => "4",:keyword => "rick springfield","$select" => "id,name,artist_name")
        ).to include("odata.metadata")
      end
    end
      
    describe :artist do
      it "without arguments" do
        expect{valid_client.search_album}.to raise_error ArgumentError
      end

      it "without argument(format)" do
        expect{valid_client.search_album("$top" => "4",:keyword => "rick springfield","$select" => "id,name,genres")}.to raise_error ArgumentError
      end

      it "without argument(top)" do
        expect{valid_client.search_album("$format" => "json",:keyword => "rick springfield","$select" => "id,name,genres")}.to raise_error ArgumentError
      end

      it "without argument(select)" do
        expect{valid_client.search_album("$format" => "json","$top" => "4",:keyword => "rick springfield")}.to raise_error ArgumentError
      end

      it "with valid arguments" do
        expect(
          valid_client.search_artist("$format" => "json","$top" => "4",:keyword => "rick springfield","$select" => "id,name,genres")
        ).to include("odata.metadata")
      end
    end

    describe :media do
      it "without arguments" do
        expect{valid_client.search_album}.to raise_error ArgumentError
      end

      it "without argument(format)" do
        expect{valid_client.search_album("$top" => "4",:keyword => "rick springfield","$select" => "id,title,artist_name")}.to raise_error ArgumentError
      end

      it "without argument(top)" do
        expect{valid_client.search_album("$format" => "json",:keyword => "rick springfield","$select" => "id,title,artist_name")}.to raise_error ArgumentError
      end

      it "without argument(select)" do
        expect{valid_client.search_album("$format" => "json","$top" => "4",:keyword => "rick springfield")}.to raise_error ArgumentError
      end

      it "with valid arguments" do
        expect(
          valid_client.search_media("$format" => "json","$top" => "4",:keyword => "rick springfield","$select" => "id,title,artist_name")
        ).to include("odata.metadata")
      end
    end

 end
end
