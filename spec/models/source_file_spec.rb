require 'spec_helper'

describe SourceFile do

  before(:each) do
    @source_file = FactoryGirl.create(:source_file, key: "meh.jpg")
  end

  it "should generate full_urls correctly when amazon_bucket_url is set" do
    bucket_buffer = ENV['amazon_bucket']
    bucket_url = ENV['amazon_bucket_url'] = "act.s.eff.org"

    full_url = @source_file.full_url

    ENV['amazon_bucket'] = bucket_buffer

    expect(full_url).to eq "https://#{bucket_url}/meh.jpg"
  end

  it "should generate full_urls correctly when amazon_bucket_url is not set based on region" do
    bucket_buffer = ENV['amazon_bucket']
    region_buffer = ENV['amazon_region']
    ENV['amazon_bucket_url'] = nil

    bucket = ENV['amazon_bucket'] = "actionbucket"
    region = ENV['amazon_region'] = "us-west-1"

    full_url = @source_file.full_url

    ENV['amazon_bucket'] = bucket_buffer
    ENV['amazon_region'] = region_buffer

    expect(full_url).to eq "https://#{bucket}.s3-#{region}.amazonaws.com/meh.jpg"
  end

end
