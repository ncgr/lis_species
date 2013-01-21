require 'spec_helper'

#
# We only need to sign in one time. Every subsequent request spec changes the
# user's role and re-authenticates by clicking the "Sign In" link.
#
describe "SignIn" do

  it "signs in via CAS" do
    create_roles
    FactoryGirl.create(:phacn_content)
    set_host
    user = create_user("superuser")
    visit phacn_contents_path
    click_link "Sign In"
    fill_in "Username", :with => user.username
    fill_in "Password", :with => user.password
    click_button "LOGIN"
  end

end
