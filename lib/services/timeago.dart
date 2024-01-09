import 'package:timeago/timeago.dart' as timeago;

class Timeago {
  static String parse (String date) {
    String timeagoText = 'przed chwilą';

    try {
      DateTime time = DateTime.parse(date);

      print('Timeoffset: ${time.timeZoneOffset.inHours}');
      
      timeagoText = timeago.format(time, locale: 'pl');
    } catch (e) {
      timeagoText = 'chwilę temu';
    }

    return timeagoText;
  }
}