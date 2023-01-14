class LoginData {
  String? phoneOrEmail;
  String? password;

  LoginData({this.phoneOrEmail, this.password});

  clearData(){
    phoneOrEmail = null;
    password = null;
  }
}
