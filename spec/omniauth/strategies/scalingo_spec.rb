require "spec_helper"

describe OmniAuth::Strategies::Scalingo do
  let(:access_token) { instance_double("AccessToken", options: {}) }
  let(:parsed_response) { instance_spy("ParsedResponse") }
  let(:response) { instance_double("Response", parsed: parsed_response) }

  subject do
    OmniAuth::Strategies::Scalingo.new({})
  end

  before(:each) do
    allow(subject).to receive(:access_token).and_return(access_token)
  end

  context "client options" do
    it "should have correct site" do
      expect(subject.options.client_options.site).to eq("https://auth.scalingo.com")
    end

    it "should have correct authorize url" do
      expect(subject.options.client_options.authorize_url).to eq("https://auth.scalingo.com/oauth/authorize")
    end

    it "should have correct token url" do
      expect(subject.options.client_options.token_url).to eq("https://auth.scalingo.com/oauth/token")
    end
  end

  context "#raw_info" do
    it "should use relative paths" do
      expect(access_token).to receive(:get).with("/v1/users/self").and_return(response)
      expect(subject.raw_info).to eq(parsed_response)
    end
  end

  describe "#callback_url" do
    it "is a combination of host, script name, and callback path" do
      allow(subject).to receive(:full_host).and_return("https://example.com")
      allow(subject).to receive(:script_name).and_return("/sub_uri")

      expect(subject.callback_url).to eq("https://example.com/sub_uri/auth/scalingo/callback")
    end
  end
end
