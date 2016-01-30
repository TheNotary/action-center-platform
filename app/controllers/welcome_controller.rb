class WelcomeController < ApplicationController
  # override default application.css/js manifests... this must have
  # been done to minimize page weight.
  # the admin view has the traditional application.css manifest
  manifest :welcome
  def index
    @actionPages = FeaturedActionPage.includes(:action_page).
                                      order('weight desc').
                                      map(&:action_page).
                                      compact
    @featuredActionPage = @actionPages.pop
    @actionPages = @actionPages.reverse
  end
end
