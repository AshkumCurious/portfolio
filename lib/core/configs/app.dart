import 'package:flutter/material.dart';

import '../../app/utils/app_typography.dart' show AppText;
import '../../app/utils/space.dart';


class App {

  static init(BuildContext context) {
    Space.init();
    AppText.init();
  }
}
