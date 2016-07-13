class GithubUserService

  def initialize
    @connection = Faraday.new("https://api.github.com")
  end

  def get_user(github_user)
    response = @connection.get("/users/#{github_user.screen_name}")
    @connection.headers["Authorization"] = "token #{github_user.oauth_token}"
    parse(response)
  end

  def get_user_events(github_user)
    response = @connection.get("/users/#{github_user.login}/events")
     @connection.headers["Authorization"] = "token #{github_user.oauth_token}"
    parse(response)
  end

  def get_user_repos(github_user)
    response = @connection.get("/users/#{github_user.login}/repos")
    @connection.headers["Authorization"] = "token #{github_user.oauth_token}"
    parse(response)
  end

  def get_feeds(github_user)
    response = @connection.get("/feeds")
    @connection.headers["Authorization"] = "token #{github_user.oauth_token}"
    parse(response)
  end

  def get_user_notifications(github_user)
    response = @connection.get("/notifications")
    @connection.headers["Authorization"] = "token #{github_user.oauth_token}"
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end

end
