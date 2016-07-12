class GithubUser < OpenStruct

  def self.service
    @@service ||= GithubUserService.new
  end

  def self.find(screen_name)
    GithubUser.new(service.get_user(screen_name))
  end

  def events
    GithubUser.service.get_user_events(login)
  end

  def push_events
    events.select do |event|
      event['type'] == "PushEvent"
    end
  end

  def repositories
    GithubUser.service.get_user_repos(login)
  end

end
