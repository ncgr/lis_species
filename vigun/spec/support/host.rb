#
# Set host for CAS Server cookie.
#
module HostMacros
  def set_host
    Capybara.current_driver    = :selenium
    Capybara.app_host          = "http://" + %x{ hostname }.chomp + ":53330"
    Capybara.run_server        = true
    Capybara.server_port       = 53330
    Capybara.default_wait_time = 5
  end
end
