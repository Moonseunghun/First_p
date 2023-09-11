import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppMessages {
  static String appTitle(BuildContext context) => Intl.message(
        'My Firebase App',
        name: 'appTitle',
        desc: 'Title for the app',
        locale: Localizations.localeOf(context).toString(),
      );
}
