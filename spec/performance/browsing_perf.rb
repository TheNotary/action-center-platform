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
      iterations = 5000
      10.times { get '/' }

      r1 = r = Benchmark.realtime do
        iterations.times { get '/' }
      end

      puts r

      sign_in_user(@user)

      10.times { get '/account' }

      r2 = r = Benchmark.realtime do
        iterations.times { get '/account' }
      end

      puts r
      puts
      puts "'/' takes #{(r1/r2).round(4)} x more time than /account"
      puts "Total Time: #{(r1+r2).round(2)}"

=begin
35.685897692s
27.7046045s

1.2881

'/' is 28% slower
=end
    end
  end
end
