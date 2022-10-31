import 'package:intl/intl.dart';

class UtilsServices {
  String priceToCurrency(double price) {
    NumberFormat format = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return format.format(price);
  }
}
