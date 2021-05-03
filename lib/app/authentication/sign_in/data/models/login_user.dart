///
class LoginUser {
  ///

  ///
  String email;

  ///
  String password;

  ///
  LoginUser({
    this.email,
    this.password,
  });

  ///
  LoginUser.fromFireBase(Map<String, dynamic> data) {
    password = data['password'];
    email = data['email'];
  }

  ///
  Map<String, dynamic> toFirebase() {
    final data = {
      "email": email,
      "password": password,
    };
    return data;
  }
}
