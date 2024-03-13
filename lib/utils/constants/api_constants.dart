class TAPiString {
  TAPiString._();

  static const String baseApiUrl =
      "https://client-backend-4pho.onrender.com/user";

  static const String baseApiUrl2 =
      "https://client-backend-4pho.onrender.com/cyco";

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

  // * Psychologist

  // ! cnic api
  static const ageGender = "$baseApiUrl2/age-gender";
  static const cnic = "$baseApiUrl2/cinic";
  // ! register
  static const psyregister = "$baseApiUrl2/register";
  // ! verify otp
  static const psyverifyOtp = "$baseApiUrl2/verify";
  // ! degree
  static const degreeImg = "$baseApiUrl2/pdf";
  // ! licience
  static const licience = "$baseApiUrl2/licience";

  // ! forgot
  static const phyforgot = "$baseApiUrl2/forgetPassword";
   // ! reset password api
  static const psyresetPassword = "$baseApiUrl2/resetPassword";
    // ! login api
  static const psylogin = "$baseApiUrl2/login";
}
