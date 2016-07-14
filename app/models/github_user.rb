class GithubUser < OpenStruct

  def self.service
    @@service = GithubUserService.new
  end

  def self.find(user)
    GithubUser.new(service.get_user(user))
  end

  def user
    User.find_by(uid: self.id)
  end

  def num_starred
    GithubUser.service.get_user_starreds(self.user).count
  end

  def orgs
    GithubUser.service.get_user_orgs(self.user)
  end

  def events
    GithubUser.service.get_user_events(self.user)
  end

  def push_events
    events.select do |event|
      event['type'] == "PushEvent"
    end
  end


  def pull_requests
    events.select do |event|
      event['type'] == "PullRequestEvent"
    end
  end

  # def commit_messages
  #   commits_hash = push_events.map do |event|
  #     {(event['repo']['name']) => (event['payload']['commits'])}
  #   end
  #
  # end

  def repositories
    GithubUser.service.get_user_repos(self.user)
  end

  def feeds
    GithubUser.service.get_feeds(self.user)
  end

  def user_feed
    GithubUser.service.get_user_feed(self.user)
  end

  def notifications
    GithubUser.service.get_user_notifications(self.user)
  end

  def received_events
    raw_events = GithubUser.service.get_received_events(self.user)
    raw_events.map do |event|
      OpenStruct.new(event)
    end
  end

  def received_push_events
    received_events.select do |event|
      event.type == "PushEvent"
    end
  end

  def received_pull_events
    received_events.select do |event|
      event.type == "PullRequestEvent"
    end
  end

  def received_create_events
    received_events.select do |event|
      event.type == "CreateEvent"
    end
  end

  def received_watch_events
    received_events.select do |event|
      event.type == "WatchEvent"
    end
  end

  def issues
    GithubUser.service.get_issues(self.user)
  end

end
