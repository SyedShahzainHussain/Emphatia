class TAPiString {
  TAPiString._();

  static const String baseApiUrl =
      "https://client-backend-4pho.onrender.com/user";

  // * Patient

  // ! register
  static const register = "$baseApiUrl/register";

  // ! registerallData
  static const registerAllData = "$baseApiUrl/updatedUser";

  // ! verify otp
  static const verifyOtp = "$baseApiUrl/verify";

  // ! login api
  static const login = "$baseApiUrl/login";

  // ! forgot api
  static const forgotPassword = "$baseApiUrl/forgetPassword";

  // ! reset password api 
  static const resetPassword = "$baseApiUrl/resetPassword";
  // ! reset password api 
  static const updateStep = "$baseApiUrl/updatedUser";

}
