# Load the Rails application.
require File.expand_path('../application', __FILE__)


CASClient::Frameworks::Rails::Filter.configure(
  :cas_base_url => "https://secure.its.yale.edu/cas/"
)

Rails.application.initialize!
