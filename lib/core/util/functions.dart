import 'package:book_reading_mobile_app/constants.dart';
import 'package:flutter/material.dart';

class FunctionUtils {
  static Future<DateTime?> selectDate(BuildContext context) async {
    final DateTime? _pickedDate = await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: kProgressIndicator,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: kProgressIndicator, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        initialDate: DateTime(DateTime.now().year - 22, DateTime.now().month),
        firstDate: DateTime(DateTime.now().year - 60, DateTime.now().month),
        lastDate: DateTime(DateTime.now().year - 18, DateTime.now().month));
    // FocusScope.of(context).requestFocus(FocusNode());

    return _pickedDate;
  }

    static String convertFullNameToAvatarText(String? name) {
    final convertName = name?.trim().split(' ').map((e) => e.isNotEmpty ? e.substring(0, 1) : '').toList() ?? [];
    if (convertName.length > 2) {
      return '${convertName.first}${convertName.last}'.toUpperCase();
    } else {
      return convertName.join('').toUpperCase();
    }
  }
}