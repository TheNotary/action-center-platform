# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a
# newer version of cucumber-rails. Consider adding your own code to a new file
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.

require 'cucumber/rails'
require 'cucumber/rspec/doubles'

Capybara.javascript_driver = :webkit

Capybara::Webkit.configure do |config|
  # config.block_unknown_urls
  config.block_url "anon-stats.eff.org"
  config.allow_url "congressforms.eff.org"
  config.allow_url "actioncenter-staging.s3-us-west-1.amazonaws.com"
  # config.allow_url "https://actionbucket.s3-us-west-1.amazonaws.com/"
end


# Capybara defaults to CSS3 selectors rather than XPath.
# If you'd prefer to use XPath, just uncomment this line and adjust any
# selectors in your step definitions to use the XPath syntax.
# Capybara.default_selector = :xpath

# By default, any exception happening in your Rails application will bubble up
# to Cucumber so that your scenario will fail. This is a different from how
# your application behaves in the production environment, where an error page will
# be rendered instead.
#
# Sometimes we want to override this default behaviour and allow Rails to rescue
# exceptions and display an error page (just like when the app is running in production).
# Typical scenarios where you want to do this is when you test your error pages.
# There are two ways to allow Rails to rescue exceptions:
#
# 1) Tag your scenario (or feature) with @allow-rescue
#
# 2) Set the value below to true. Beware that doing this globally is not
# recommended as it will mask a lot of errors for you!
#
ActionController::Base.allow_rescue = false

# Remove/comment out the lines below if your app doesn't have a database.
# For some databases (like MongoDB and CouchDB) you may need to use :truncation instead.
begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

# You may also want to configure DatabaseCleaner to use different strategies for certain features and scenarios.
# See the DatabaseCleaner documentation for details. Example:
#
#   Before('@no-txn,@selenium,@culerity,@celerity,@javascript') do
#     # { :except => [:widgets] } may not do what you expect here
#     # as Cucumber::Rails::Database.javascript_strategy overrides
#     # this setting.
#     DatabaseCleaner.strategy = :truncation
#   end
#
#   Before('~@no-txn', '~@selenium', '~@culerity', '~@celerity', '~@javascript') do
#     DatabaseCleaner.strategy = :transaction
#   end
#

# Possible values are :truncation and :transaction
# The :transaction strategy is faster, but might give you threading problems.
# See https://github.com/cucumber/cucumber-rails/blob/master/features/choose_javascript_database_strategy.feature
Cucumber::Rails::Database.javascript_strategy = :truncation


def stub_smarty_streets
  stub_resp = {"city"=>"San Francisco", "state_abbreviation"=>"CA", "state"=>"California", "mailable_city"=>true}
  allow(SmartyStreets).to receive(:get_city_state).with("94109").and_return(stub_resp)
end


def stub_smarty_streets_street_address
  stubbed_address = '[{"input_index":0,"candidate_index":0,"delivery_line_1":"815 Eddy St","last_line":"San Francisco CA 94109-7701","delivery_point_barcode":"941097701156","components":{"primary_number":"815","street_name":"Eddy","street_suffix":"St","city_name":"San Francisco","state_abbreviation":"CA","zipcode":"94109","plus4_code":"7701","delivery_point":"15","delivery_point_check_digit":"6"},"metadata":{"record_type":"S","zip_type":"Standard","county_fips":"06075","county_name":"San Francisco","carrier_route":"C043","congressional_district":"12","rdi":"Commercial","elot_sequence":"0167","elot_sort":"A","latitude":37.78277,"longitude":-122.42104,"precision":"Zip9","time_zone":"Pacific","utc_offset":-8,"dst":true},"analysis":{"dpv_match_code":"Y","dpv_footnotes":"AABB","dpv_cmra":"N","dpv_vacant":"N","active":"Y"}}]'
  allow_any_instance_of(SmartyStreetsController).to receive(:get_data_on_address_zip).and_return(stubbed_address)
end

def stub_legislator_by_zip
  x = YAML.load "---\n- !ruby/object:Sunlight::Congress::Legislator\n  bioguide_id: P000197\n  birthday: '1940-03-26'\n  chamber: house\n  contact_form: http://pelosi.house.gov/contact-me/email-me\n  crp_id: N00007360\n  district: 12\n  facebook_id: '86574174383'\n  fax: 202-225-8259\n  fec_ids:\n  - H8CA05035\n  first_name: Nancy\n  gender: F\n  govtrack_id: '400314'\n  icpsr_id: 15448\n  in_office: true\n  last_name: Pelosi\n  leadership_role: Minority Leader\n  middle_name: \n  name_suffix: \n  nickname: \n  oc_email: Rep.Pelosi@opencongress.org\n  ocd_id: ocd-division/country:us/state:ca/cd:12\n  office: 233 Cannon House Office Building\n  party: D\n  phone: 202-225-4965\n  state: CA\n  state_name: California\n  term_end: '2017-01-03'\n  term_start: '2015-01-06'\n  thomas_id: 00905\n  title: Rep\n  twitter_id: NancyPelosi\n  votesmart_id: 26732\n  website: http://pelosi.house.gov\n  youtube_id: nancypelosi\n- !ruby/object:Sunlight::Congress::Legislator\n  bioguide_id: B000711\n  birthday: '1940-11-11'\n  chamber: senate\n  contact_form: https://www.boxer.senate.gov/contact/shareyourviews.html\n  crp_id: N00006692\n  district: \n  facebook_id: '116513005087055'\n  fax: 202-224-0454\n  fec_ids:\n  - S2CA00286\n  - H2CA06028\n  - P80003247\n  first_name: Barbara\n  gender: F\n  govtrack_id: '300011'\n  icpsr_id: 15011\n  in_office: true\n  last_name: Boxer\n  middle_name: \n  name_suffix: \n  nickname: \n  oc_email: Sen.Boxer@opencongress.org\n  ocd_id: ocd-division/country:us/state:ca\n  office: 112 Hart Senate Office Building\n  party: D\n  phone: 202-224-3553\n  state: CA\n  state_name: California\n  term_end: '2017-01-03'\n  term_start: '2011-01-05'\n  thomas_id: '00116'\n  title: Sen\n  twitter_id: SenatorBoxer\n  votesmart_id: 53274\n  website: http://www.boxer.senate.gov\n  youtube_id: SenatorBoxer\n  lis_id: S223\n  senate_class: 3\n  state_rank: junior\n- !ruby/object:Sunlight::Congress::Legislator\n  bioguide_id: F000062\n  birthday: '1933-06-22'\n  chamber: senate\n  contact_form: https://www.feinstein.senate.gov/public/index.cfm/e-mail-me\n  crp_id: N00007364\n  district: \n  facebook_id: '334887279867783'\n  fax: 202-228-3954\n  fec_ids:\n  - S0CA00199\n  first_name: Dianne\n  gender: F\n  govtrack_id: '300043'\n  icpsr_id: 49300\n  in_office: true\n  last_name: Feinstein\n  middle_name: \n  name_suffix: \n  nickname: \n  oc_email: Sen.Feinstein@opencongress.org\n  ocd_id: ocd-division/country:us/state:ca\n  office: 331 Hart Senate Office Building\n  party: D\n  phone: 202-224-3841\n  state: CA\n  state_name: California\n  term_end: '2019-01-03'\n  term_start: '2013-01-03'\n  thomas_id: '01332'\n  title: Sen\n  twitter_id: SenFeinstein\n  votesmart_id: 53273\n  website: http://www.feinstein.senate.gov\n  youtube_id: SenatorFeinstein\n  lis_id: S221\n  senate_class: 1\n  state_rank: senior\n"
  allow_any_instance_of(ToolsController).to receive(:get_the_reps).and_return(x)
end
