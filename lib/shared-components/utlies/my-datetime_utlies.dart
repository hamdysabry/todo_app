import 'package:intl/intl.dart';

class MyDatetimeUtiles {
  static String formatDate(DateTime dateTime) {
    DateFormat formater = DateFormat("dd/MM/yyyy");
    return formater.format(dateTime);
  }
}
