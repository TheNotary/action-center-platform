# require 'performance_helper'
require 'rails_helper'
require 'benchmark'

describe "App Speed", :type => :request do
  context "page performance" do

    before(:each) do
      @action_page = FactoryGirl.create(:petition_with_99_signatures_needing_1_more).action_page
      @user = FactoryGirl.create(:user)
    end

    it 'should be fast' do
      iterations = 10
      get '/'

      r = Benchmark.realtime do
        iterations.times {get '/'}
      end

      puts r

      sign_in_user(@user)

      r = Benchmark.realtime do
        iterations.times { get '/account'}
      end

      puts r
    end
  end
end
