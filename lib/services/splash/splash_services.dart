import 'dart:async';

import 'package:flutter/material.dart';

import '../../../configs/routes/routes_name.dart';


/// A class containing services related to the splash screen.
class SplashServices {

  ///
  /// Takes a [BuildContext] as input and navigates to the city screen,
  void runTimer(BuildContext context) async {
        Timer(
          const Duration(seconds: 2),
          () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false),
        );

  }
}
