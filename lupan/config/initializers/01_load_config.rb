# Load URLS
#
# RAILS_ROOT/config/initializers/devise.rb depends on this file.
# Hence the 01_ prefix to the filename.
# See http://guides.rubyonrails.org/configuring.html
# for more information.
#
URLS = YAML.load_file("#{::Rails.root.to_s}/config/urls.yml")[::Rails.env]
