#
# Set host for CAS Server cookie.
#
module HostMacros
  def set_host(host)
    Capybara.app_host          = "http://" << host
    Capybara.run_server        = true
    Capybara.server_port       = 53330
    Capybara.default_wait_time = 5
  end
end
