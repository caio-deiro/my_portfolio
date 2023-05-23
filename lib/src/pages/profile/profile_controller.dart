import 'dart:io';

import 'package:app_miscelanea/src/pages/profile/model/habilities_model.dart';
import 'package:app_miscelanea/src/pages/profile/model/tecnology_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileController {
  var tecnologyList = <TecnologyModel>[
    TecnologyModel('Flutter', Image.asset('assets/images/flutter-logo.png')),
    TecnologyModel('Dart', Image.asset('assets/images/dart-logo.png')),
    TecnologyModel('Firebase', Image.asset('assets/images/firebase-logo.png')),
    TecnologyModel('Github', Image.asset('assets/images/github-logo.png')),
  ];

  var habilitiesList = <HabilitiesModel>[
    HabilitiesModel('Dart', 0.6),
    HabilitiesModel('Flutter', 0.8),
    HabilitiesModel('Firebase', 0.5),
    HabilitiesModel('Git', 0.65),
  ];

  Future<void> launchWhatsApp() async {
    var androidUrl = 'https://wa.me/+5571993067834';
    var iosUrl = 'https://wa.me/+5571993067834';

    if (Platform.isIOS) {
      await launchUrl(
        Uri.parse(iosUrl),
        mode: LaunchMode.externalApplication,
      );
    } else if (Platform.isAndroid) {
      await launchUrl(
        Uri.parse(androidUrl),
        mode: LaunchMode.externalApplication,
      );
    }
  }

  Future<void> launchGitHub() async {
    var gitUri = Uri.parse('https://github.com/caio-deiro');

    await launchUrl(
      gitUri,
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> launchLinkedin() async {
    var linkedinUri = Uri.parse('https://www.linkedin.com/in/caio-deiro-000/');

    await launchUrl(
      linkedinUri,
      mode: LaunchMode.externalApplication,
    );
  }
}
