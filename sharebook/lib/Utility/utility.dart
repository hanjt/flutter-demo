bool isMail(String mail) {
    return new RegExp(r"^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$").hasMatch(mail.trim());
  }

bool isPassword(String password) {
  return new RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8}$").hasMatch(password.trim());
}