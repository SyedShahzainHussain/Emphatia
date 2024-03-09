class TValidation {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is requried";
    }
    final emailregExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailregExp.hasMatch(value)) {
      return "Invalid email address";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is requried";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters long.";
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must contains at least one uppercase letter.";
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contains  one number.";
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),./";!<>]'))) {
      return "Password must contains at least one special letter.";
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is requried";
    }
    final phoneReg = RegExp(r'^\d{11}$');
    if (!phoneReg.hasMatch(value)) {
      return "Invalid phone number format (11 digits requried).";
    }
    return null;
  }
}
