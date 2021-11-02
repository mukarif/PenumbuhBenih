import 'package:intl/intl.dart';

dateFormat(String date) {
  DateTime now = DateTime.parse(date);
  String formattedDate = DateFormat("d MMMM yyyy").format(now);
  return formattedDate;
}
