class GithubUserService

  def initialize
    @connection = Faraday.new("https://api.github.com")
  end

  def get_user(user)
    # @connection.headers["Authorization"] = "token #{user.oauth_token}"
    response = @connection.get("/users/#{user.screen_name}")
    parse(response)
  end

  def get_user_starreds(user)
    # @connection.headers["Authorization"] = "token #{user.oauth_token}"
    response = @connection.get("/users/#{user.screen_name}/starred")
    parse(response)
  end

  def get_user_orgs(user)
    @connection.headers["Authorization"] = "token #{user.oauth_token}"
    response = @connection.get("/user/orgs")
    parse(response)
  end

  def get_user_events(user)
    @connection.headers["Authorization"] = "token #{user.oauth_token}"
    response = @connection.get("/users/#{user.screen_name}/events")
    parse(response)
  end

  def get_user_repos(user)
    @connection.headers["Authorization"] = "token #{user.oauth_token}"
    response = @connection.get("/users/#{user.screen_name}/repos")
    parse(response)
  end

  def get_feeds(user)
    @connection.headers["Authorization"] = "token #{user.oauth_token}"
    response = @connection.get("/feeds")
    parse(response)
  end

  def get_user_notifications(user)
    @connection.headers["Authorization"] = "token #{user.oauth_token}"
    response = @connection.get("/notifications")
    parse(response)
  end

  def get_received_events(user)
    @connection.headers["Authorization"] = "token #{user.oauth_token}"
    response = @connection.get("/users/#{user.screen_name}/received_events")
    parse(response)
  end

  def get_issues(user)
    @connection.headers["Authorization"] = "token #{user.oauth_token}"
    response = @connection.get("/issues")
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end

end
