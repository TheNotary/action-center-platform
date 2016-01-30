module ApplicationHelper
  include RegionHelper

  def page_title
    [@title, I18n.t('site_title')].compact.join(' | ')
  end

  def escape_page_title
    URI.escape(page_title , Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
  end

  def twitter_handle
    '@' + Rails.application.config.twitter_handle.to_s
  end

  def markdown(blogtext)
    renderOptions = {hard_wrap: true, filter_html: false}
    markdownOptions = {autolink: true, no_intra_emphasis: true, fenced_code_blocks: true}
    markdown = Redcarpet::Markdown.new(MarkdownRenderer.new(renderOptions), markdownOptions)
    markdown.render(blogtext).html_safe
  end

  def stripdown(str)
    require 'redcarpet/render_strip'
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
    renderer.render(str)
  end

  def current_email
    current_user_data(:email)
  end

  def current_first_name
    current_user_data(:first_name)
  end

  def current_last_name
    current_user_data(:last_name)
  end

  def current_street_address
    current_user_data(:street_address)
  end

  def current_city
    current_user_data(:city)
  end

  def current_state
    current_user_data(:state)
  end

  def current_zipcode
    current_user_data(:zipcode)
  end

  def current_country_code
    current_user_data(:country_code)
  end

  def congress_forms_date_fills_url campaign_tag = nil, date_start = nil, date_end = nil, bioguide_id = nil
    url = Rails.application.config.congress_forms_url + '/successful-fills-by-date/'
    url = url + bioguide_id unless bioguide_id.nil?
    url = url + '?'
    url = url + 'campaign_tag=' + Rack::Utils.escape(CGI::escapeHTML(campaign_tag)) unless campaign_tag.nil?
    url = url + '&time_zone=' + Rack::Utils.escape(Time.zone.name)
    url = url + '&give_as_utc=true'
    url = url + '&debug_key=' + Rails.application.secrets.congress_forms_debug_key
    url = url + '&date_start=' + date_start.to_s unless date_start.nil?
    url = url + '&date_end=' + date_end.to_s unless date_end.nil?
    url
  end

  def congress_forms_hour_fills_url campaign_tag = nil, date = nil, bioguide_id = nil
    url = Rails.application.config.congress_forms_url + '/successful-fills-by-hour/'
    url = url + bioguide_id unless bioguide_id.nil?
    url = url + '?'
    url = url + 'campaign_tag=' + Rack::Utils.escape(CGI::escapeHTML(campaign_tag)) unless campaign_tag.nil?
    url = url + '&time_zone=' + Rack::Utils.escape(Time.zone.name)
    url = url + '&give_as_utc=true'
    url = url + '&debug_key=' + Rails.application.secrets.congress_forms_debug_key
    url = url + '&date=' + date.strftime('%Y-%m-%d').to_s unless date.nil?
    url
  end

  def congress_forms_member_fills_url campaign_tag = nil
    url = Rails.application.config.congress_forms_url + '/successful-fills-by-member/?'
    url = url + 'campaign_tag=' + Rack::Utils.escape(CGI::escapeHTML(campaign_tag)) unless campaign_tag.nil?
    url = url + '&debug_key=' + Rails.application.secrets.congress_forms_debug_key
    url
  end

  def update_user_data(params={})
    params = params.with_indifferent_access.slice(*user_session_data_whitelist)
    if user_signed_in?
      p = params.clone
      p.delete(:email)
      current_user.update_attributes p
    else
      session[:user] ||= {}
      session[:user].merge! params
    end
  end

  def sanitize_filename(filename)
    # Split the name when finding a period which is preceded by some
    # character, and is followed by some character other than a period,
    # if there is no following period that is followed by something
    # other than a period (yeah, confusing, I know)
    fn = filename.split(/(?<=.)\.(?=[^.])(?!.*\.[^.])/m)

    # We now have one or two parts (depending on whether we could find
    # a suitable period). For each of these parts, replace any unwanted
    # sequence of characters with an underscore
    fn.map! { |s| s.gsub(/[^a-z0-9\-]+/i, '_') }

    # Finally, join the parts with a period and return the result
    return fn.join '.'
  end

  private
  def user_session_data_whitelist
    [:email, :last_name, :first_name, :street_address, :city, :state, :zipcode,
     :country_code, :phone]
  end

  def current_user_data(field)
    session[:user] ||= {}
    return nil unless user_session_data_whitelist.include? field
    current_user.try(field) || session[:user][field]
  end
end
