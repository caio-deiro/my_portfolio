import 'package:app_miscelanea/src/pages/projects/animation/button_animation.dart';
import 'package:app_miscelanea/src/pages/projects/animation/cube_animation.dart';
import 'package:app_miscelanea/src/pages/projects/calculator/calculator_page.dart';

import 'package:app_miscelanea/src/pages/projects/projects_page.dart';
import 'package:flutter/material.dart';

import 'cpf_generator/page/cpf_generator_page.dart';

var projectRoutes = <String, WidgetBuilder>{
  '/projects': (context) => ProjectsPage(),
  '/projects/animation/basic': (context) => ButtonAnimation(),
  '/projects/animation/cube': (context) => CubeAnimation(),
  '/projects/calculator': (context) => CalculatorPage(),
  '/projects/cpf/generator': (context) => CpfGenerator(),
};
