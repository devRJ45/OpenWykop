class ApiProperties {
  String apiHost;
  List<String> apiPath;
  bool loggedIn;
  String? token;
  String? refreshToken;

  ApiProperties({
    this.apiHost = 'wykop.pl',
    this.apiPath = const ['api', 'v3'],
    this.loggedIn = false,
    this.token,
    this.refreshToken
  });

  void setToken (String token, [String? refreshToken]) {
    this.token = token;

    if (refreshToken != null) {
      this.refreshToken = refreshToken;
    }
  }
}