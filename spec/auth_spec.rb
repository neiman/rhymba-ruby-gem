require_relative './spec_helper'

RSpec.describe Rhymba::Client, :vcr do
  describe :auth do
    describe :content do
      it "without arguments" do
        expect{valid_client.auth_token_content}.to raise_error ArgumentError
      end

      it "without argument(method)" do
        expect{valid_client.auth_token_content(:ttl => 180, :mediaId => test_media_id.to_i, :use_limit => 100, :bitrate => 128, :encoding => "'mp3'", :fadeEnd => 0, :fadeStart => 0, :https => "true",:mono => "false", :protocol => "'http'", :trimEnd => 0, :trimStart => 0)}.to raise_error ArgumentError
      end
      
      it "without argument(ttl)" do
        expect{valid_client.auth_token_content(:method => "GetStream", :mediaId => test_media_id.to_i, :use_limit => 100, :bitrate => 128, :encoding => "'mp3'", :fadeEnd => 0, :fadeStart => 0, :https => "true",:mono => "false", :protocol => "'http'", :trimEnd => 0, :trimStart => 0)}.to raise_error ArgumentError
      end


      it "with valid arguments" do
        expect(
          valid_client.auth_token_content(:method => "GetStream", :ttl => 180, :mediaId => test_media_id.to_i, :use_limit => 100, :bitrate => 128, :encoding => "'mp3'", :fadeEnd => 0, :fadeStart => 0, :https => "true",:mono => "false", :protocol => "'http'", :trimEnd => 0, :trimStart => 0)
        ).to include("access_req")
      end
    end
  end
end
