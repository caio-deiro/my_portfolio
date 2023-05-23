import 'package:app_miscelanea/src/pages/profile/profile_controller.dart';
import 'package:flutter/material.dart';

class UserCardProfileWidget extends StatelessWidget {
  UserCardProfileWidget({Key? key}) : super(key: key);

  final controller = ProfileController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 320,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // foto de perfil
            Container(
                width: 116,
                height: 116,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.jpg'))),
            SizedBox(height: 15),
            Text(
              'Caio Deiró',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 10),
            Flexible(
              child: Text(
                'Olá tudo bem? Estudo Flutter e Dart a quase 2 anos, desde então ja trabalhei'
                ' com alguns apps voltados para o mercado de delivery, vendas e gestão de pessoas. '
                'Sou dedicado, calmo, racional e sei buscar alternativas e soluções quando encontro problemas.',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 45),
            SizedBox(
              width: 150,
              height: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await controller.launchWhatsApp();
                    },
                    child: Image.asset(
                      'assets/icons/Icon-ionic-logo-whatsapp.png',
                      color: Colors.green,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await controller.launchGitHub();
                    },
                    child: Image.asset(
                      'assets/icons/Icon-awesome-github.png',
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await controller.launchLinkedin();
                    },
                    child: Image.asset(
                      'assets/icons/Icon-awesome-linkedin.png',
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
