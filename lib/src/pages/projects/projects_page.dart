import 'package:app_miscelanea/src/pages/projects/widget/listtile_widget.dart';
import 'package:app_miscelanea/src/shared/widgets/app_base.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBase(
      title: 'Alguns exemplos de projeto',
      child: Column(
        children: [
          ListtileWidget(
            title: 'Animação Explicita básica',
            onPressed: () =>
                Navigator.pushNamed(context, '/projects/animation/basic'),
          ),
          ListtileWidget(
            title: 'Animação Explicita cubo',
            onPressed: () =>
                Navigator.pushNamed(context, '/projects/animation/cube'),
          ),
          ListtileWidget(
            title: 'Calculadora',
            onPressed: () =>
                Navigator.pushNamed(context, '/projects/calculator'),
          ),
          ListtileWidget(
            title: 'Validação e Geração de CPF válido',
            onPressed: () =>
                Navigator.pushNamed(context, '/projects/cpf/generator'),
          ),
        ],
      ),
    );
  }
}
