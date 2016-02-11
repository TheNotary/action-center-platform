FactoryGirl.define do
  factory :email_campaign do
    
    # topic_category_id 1
    message "Here's a message"
    subject "Cosponsor the PETITION Act, anti-SLAPP legislation..."
    target_house true
    target_senate true
    campaign_tag "Support Federal Protection for Blogger's Rights"
    email_addresses ""
    target_email false
    target_bioguide_id false
    bioguide_id ""


    after(:create) do |petition|
      FactoryGirl.create(:action_page_with_email, email_campaign_id: petition.id)
    end
  end


end
