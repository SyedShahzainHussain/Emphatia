import 'package:intl/intl.dart';

class TFormatUtils {
  TFormatUtils._();

  static String formattedData(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat("dd/MMM/yyyy").format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: "en_US", symbol: '\$').format(amount);
  }

  static String formattedPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 11) {
      return '${(phoneNumber.substring(0, 3))} ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    }
    return phoneNumber;
  }
}
