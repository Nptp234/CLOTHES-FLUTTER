import 'package:intl/intl.dart';

String formatDateTime(String datetimeString) {
  DateTime dateTime = DateTime.parse(datetimeString);
  String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
  return formattedDateTime;
}