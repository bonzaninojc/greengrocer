import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class UtilsServices {
  String priceToCurrency(double price) {
    NumberFormat format = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return format.format(price);
  }

  String formateDateTime(DateTime dataRaw) {
    initializeDateFormatting();

    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(dataRaw);
  }
}
