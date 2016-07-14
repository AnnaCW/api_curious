require './test/test_helper'

class GithubUserServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def setup
    @service = GithubUserService.new
  end

  test '#github_users' do
    user = User.create(uid: 1, screen_name: "mojombo")
      VCR.use_cassette('github_user_service#get_user') do
        github_user = service.get_user(user)

        assert_equal "Tom Preston-Werner", github_user['name']
        assert_equal "San Francisco", github_user['location']
      end
  end


  test '#github_user_starreds' do
    user = User.create(uid: 19, screen_name: "brynary")
      VCR.use_cassette('github_user_service#get_user_starreds') do
        starreds = service.get_user_starreds(user)
        assert_equal "misspell", starreds.first['name']
    end
  end
end
