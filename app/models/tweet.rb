class Tweet < ActiveRecord::Base
  has_one :action_page
  has_many :tweet_targets
  alias :targets :tweet_targets
  accepts_nested_attributes_for :tweet_targets, reject_if: :all_blank,
    allow_destroy: true
end
