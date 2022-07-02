// ignore_for_file: constant_identifier_names

import 'package:intl/intl.dart';

enum Pattern {
  hhmm,
  ddmmm,
  md,
  ddMMyyyy,
  ddMMyyyy_vi,
  ddMMMMyyyy,
  ddMMMMyyyyHHmm,
  yyyyMMddHHmm,
  yyyyMMddHHmm_JP,
  yyyyMMdd,
  yyyyMMddHHmmss,
  yyyyMMddHHmmss_JP,
  yyyyMM_JP,
  yyyyMM
}

extension PatternExtension on Pattern {
  String get pattern {
    switch (this) {
      case Pattern.hhmm:
        return 'HH:mm';
      case Pattern.ddmmm:
        return 'dd MMM';
      case Pattern.md:
        return 'M/d';
      case Pattern.ddMMyyyy:
        return 'dd MM yyyy';
      case Pattern.ddMMyyyy_vi:
        return 'dd/MM/yyyy';
      case Pattern.ddMMMMyyyy:
        return 'dd MMMM yyyy';
      case Pattern.ddMMMMyyyyHHmm:
        return 'dd MMMM yyyy, HH:mm';
      case Pattern.yyyyMMddHHmm:
        return 'yyyy/MM/dd HH:mm';
      case Pattern.yyyyMMddHHmm_JP:
        return 'yyyy年 MM月 dd日 HH時 mm分';
      case Pattern.yyyyMMdd:
        return 'yyyy年　MM月　dd日';
      case Pattern.yyyyMMddHHmmss:
        return 'yyyy-MM-dd HH:mm:ss';
      case Pattern.yyyyMMddHHmmss_JP:
        return 'yyyy-MM-dd HH:mm:ss';
      case Pattern.yyyyMM_JP:
        return 'yyyy年 MM月';
      case Pattern.yyyyMM:
        return 'yyyy-MM';
      default:
        return '';
    }
  }
}

class DateTimeUtils {
  static const secondMillis = 1000;
  static const minuteMillis = 60 * secondMillis;
  static const hourMillis = 60 * minuteMillis;
  static const dayMillis = 24 * hourMillis;
  static const weekMillis = 7 * dayMillis;
  static const minuteSecond = 60;
  static const hourSecond = 60 * minuteSecond;
  static const monthMillis = 31 * dayMillis;
  static const quarterMillis = 3 * monthMillis;

  static DateTime getDateTime(dynamic dateToConvert, {Pattern? pattern}) {
    if (dateToConvert is int) {
      return DateTime.fromMillisecondsSinceEpoch(dateToConvert);
    } else if (dateToConvert is String) {
      return DateFormat(pattern!.pattern).parse(dateToConvert);
    }
    return dateToConvert;
  }

  static String? getStringDate(dynamic dateToConvert,
      {required Pattern pattern, String? languageCode}) {
    if (dateToConvert == null) {
      return '';
    }
    final dateFormat = DateFormat(pattern.pattern, languageCode);
    if (dateToConvert is int) {
      final datetime = getDateTime(dateToConvert);
      return dateFormat.format(datetime);
    } else if (dateToConvert is DateTime) {
      return dateFormat.format(dateToConvert);
    }
    return null;
  }

  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
            .difference(DateTime(now.year, now.month, now.day))
            .inDays ==
        0;
  }

  static String customGetStringDate(dynamic dateToConvert) {
    if (dateToConvert is int) {
      final datetime = getDateTime(dateToConvert);
      return 'Ngày ${datetime.day} tháng ${datetime.month} năm ${datetime.year}';
    } else if (dateToConvert is DateTime) {
      return 'Ngày ${dateToConvert.day} tháng ${dateToConvert.month} năm ${dateToConvert.year}';
    }
    return '';
  }

  static int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  static String? getStringTimeAgo(dynamic time, Pattern patternConvert,
      {String? languageCode}) {
    final datetime = getTimestamp(time, patternConvert);
    final diff = DateTime.now().millisecondsSinceEpoch - datetime;
    if (diff < minuteMillis) {
      return 'vừa xong';
    } else if (diff < 60 * minuteMillis) {
      final minute = diff ~/ minuteMillis;
      return '$minute ${Intl.plural(minute, one: 'phút', other: 'phút')}';
    } else if (diff < 24 * hourMillis) {
      final hour = diff ~/ hourMillis;
      return '$hour ${Intl.plural(hour, one: 'giờ', other: 'giờ')}';
    } else if (diff < weekMillis) {
      final day = (diff / dayMillis).round();
      return '$day ${Intl.plural(day, one: 'ngày', other: 'ngày')}';
    } else if (diff < monthMillis) {
      final week = diff ~/ weekMillis;
      return '$week ${Intl.plural(week, one: 'tuần', other: 'tuần')}';
    } else if (diff < quarterMillis) {
      final month = diff ~/ monthMillis;
      return '$month ${Intl.plural(month, one: 'tháng', other: 'tháng')}';
    }
    return getStringDate(datetime,
        pattern: patternConvert, languageCode: languageCode);
  }

  static int getTimestamp(dynamic dateToConvert, Pattern pattern) {
    if (dateToConvert is DateTime) {
      return dateToConvert.millisecondsSinceEpoch;
    } else if (dateToConvert is String) {
      final dateFormat = DateFormat(pattern.pattern);
      return dateFormat.parse(dateToConvert).millisecondsSinceEpoch;
    }
    return 0;
  }
}
