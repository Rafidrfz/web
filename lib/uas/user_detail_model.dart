class UserDetail {
  final String login;
  final String avatarUrl;
  final String htmlUrl;
  final String gistsUrl;
  final String reposUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final int followers;
  final int following;
  final String type;
  final String userViewType;

  UserDetail({
    required this.login,
    required this.avatarUrl,
    required this.htmlUrl,
    required this.gistsUrl,
    required this.reposUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.followers,
    required this.following,
    required this.type,
    required this.userViewType,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      login: json['login'],
      avatarUrl: json['avatar_url'],
      htmlUrl: json['html_url'],
      gistsUrl: json['gists_url'],
      reposUrl: json['repos_url'],
      subscriptionsUrl: json['subscriptions_url'],
      organizationsUrl: json['organizations_url'],
      eventsUrl: json['events_url'],
      receivedEventsUrl: json['received_events_url'],
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
      type: json['type'] ?? '',
      userViewType: json['user_view_type'] ?? '',
    );
  }
}
