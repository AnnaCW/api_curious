require './test/test_helper'

class GithubUserTest < ActiveSupport::TestCase

  test '#github_user_find' do
    user = User.create(uid: 19, screen_name: "brynary")
      VCR.use_cassette('github_user#find') do
        github_user = GithubUser.find(user)

        assert_equal "Bryan Helmkamp", github_user.name
        assert_equal "New York City", github_user.location
      end
  end

end
