class GithubUserService

  def initialize
    @connection = Faraday.new("https://api.github.com")
  end

  def get_user(screen_name)
    response = @connection.get("/users/#{screen_name}")
    parse(response)
  end

  def get_user_events(login)
    response = @connection.get("/users/#{login}/events")
    parse(response)
  end

  def get_user_repos(login)
    response = @connection.get("/users/#{login}/repos")
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end

end
