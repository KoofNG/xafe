///
class AppUser {
  ///
  String fullName;

  ///
  String email;

  ///
  String code;

  ///
  AppUser({
    this.email,
    this.code,
    this.fullName,
  });

  ///
  AppUser.fromFireBase(Map<String, dynamic> data) {
    code = data['code'];
    email = data['email'];
    fullName = data['full_name'];
  }

  ///
  Map<String, dynamic> toFirebase() {
    final data = {
      "email": email,
      "code": code,
      "full_name": fullName,
    };
    return data;
  }
}
