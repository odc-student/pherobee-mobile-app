bool isEmailValid(String email) {
  // Regular expression for a basic email validation
  final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  // Check if the provided email matches the regular expression
  return emailRegExp.hasMatch(email);
}