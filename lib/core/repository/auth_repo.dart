abstract class AuthRepo {
  Future login(String login, String password);

  Future logout();

  Future register(String nickname, String firstName, String lastName, String password);
}
