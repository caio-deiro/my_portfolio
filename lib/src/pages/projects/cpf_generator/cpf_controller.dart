import 'dart:async';

import 'package:app_miscelanea/src/pages/projects/cpf_generator/cpf_model.dart';
import 'package:flutter/material.dart';

class CpfController extends ChangeNotifier {
  late CpfModel cpfModel;

  bool enableButton = true;

  bool showText = false;

  String cpfGenerated = '';

  TextEditingController cpfController = TextEditingController();

  void generateCpf() {
    final cpfModel = CpfModel(cpf: '');
    cpfGenerated = cpfModel.generateCpf();
    notifyListeners();
  }

  bool validateCpf(String cpf) {
    cpfModel = CpfModel(cpf: cpf);
    return cpfModel.validateCpf();
  }

  void enableButtonAfterSecondsOver() {
    enableButton = false;
    notifyListeners();
    Timer(Duration(milliseconds: 3500), () {
      enableButton = true;
      notifyListeners();
    });
  }
}
