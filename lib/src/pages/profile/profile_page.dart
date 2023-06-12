import 'package:app_miscelanea/src/pages/profile/profile_controller.dart';
import 'package:app_miscelanea/src/pages/profile/widget/habilities_card_widget.dart';
import 'package:app_miscelanea/src/pages/profile/widget/tecnology_card_widget.dart';
import 'package:app_miscelanea/src/pages/profile/widget/user_card_profile_widget.dart';
import 'package:app_miscelanea/src/shared/widgets/app_base.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final controller = ProfileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBase(
          title: 'Sobre mim',
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UserCardProfileWidget(),
                SizedBox(height: 20),
                Text('Tecnologias no qual tenho conhecimento'),
                SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                      itemCount: controller.tecnologyList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var tecnology = controller.tecnologyList[index];
                        return TecnologyCardWidget(
                          tecnologyName: tecnology.name,
                          imageAsset: tecnology.logo,
                        );
                      }),
                ),
                SizedBox(height: 10),
                Text('Habilidades e Competências'),
                SizedBox(height: 10),
                HabilitiesCardWidget(),
                SizedBox(height: 10),
              ],
            ),
          )),
    );
  }
}
