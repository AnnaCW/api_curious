require "test_helper"

class UserLogsInWithGithubTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = ApiCurious::Application
    stub_omniauth
  end

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_link "LogIn"
    assert_equal "/", current_path
    assert page.has_content?("Logged in as")
    assert page.has_content?("Anna")
    assert page.has_link?("Logout")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      extra: {
        raw_info: {
          user_id: "1234",
          name: "Anna",
          screen_name: "aw123"
        }
      },
      credentials: {
        token: "token1",
        secret: "secret123"
      }
    })
  end
end
