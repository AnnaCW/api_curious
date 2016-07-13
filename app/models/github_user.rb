class GithubUser < OpenStruct

  def self.service
    @@service = GithubUserService.new
  end

  def self.find(github_user)
    GithubUser.new(service.get_user(github_user))
  end

  def events
    GithubUser.service.get_user_events(self)
  end

  def push_events
    events.select do |event|
      event['type'] == "PushEvent"
    end
  end


  # def commit_messages
  #   commits_hash = push_events.map do |event|
  #     {(event['repo']['name']) => (event['payload']['commits'])}
  #   end
  #
  # end

  def repositories
    GithubUser.service.get_user_repos(self)
  end

  def feeds
    GithubUser.service.get_feeds(self)
  end

  def user_feed
    GithubUser.service.get_user_feed(self)
  end

end
