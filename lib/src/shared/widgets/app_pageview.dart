import 'package:app_miscelanea/src/pages/profile/profile_page.dart';
import 'package:app_miscelanea/src/pages/projects/projects_page.dart';
import 'package:app_miscelanea/src/pages/repos_page/repos_page.dart';
import 'package:flutter/material.dart';

class AppPageView extends StatefulWidget {
  const AppPageView({Key? key}) : super(key: key);

  @override
  State<AppPageView> createState() => _AppPageViewState();
}

class _AppPageViewState extends State<AppPageView> {
  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  var index = 0;
  var pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        onTap: (value) {
          setState(() {
            index = value;
          });
          if (value == 0) {
            pageViewController.jumpToPage(0);
          } else if (value == 1) {
            pageViewController.jumpToPage(1);
          } else {
            pageViewController.jumpToPage(2);
          }
        },
        currentIndex: index,
        unselectedIconTheme: IconThemeData(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.white),
        unselectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(color: Colors.blue),
        items: [
          BottomNavigationBarItem(
            label: 'Sobre o dev',
            icon: Icon(
              Icons.person,
              color: Theme.of(context).highlightColor,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Projetos',
            icon: SizedBox(
              height: 22,
              child: Image.asset(
                'assets/images/flutter-logo.png',
                color: Theme.of(context).highlightColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Repositórios',
            icon: Image.asset(
              'assets/icons/Icon-awesome-github.png',
              color: Theme.of(context).highlightColor,
            ),
          ),
        ],
      ),
      body: PageView(
        controller: pageViewController,
        // physics: NeverScrollableScrollPhysics(),
        onPageChanged: (indexPage) {
          index = indexPage;
        },
        children: [
          ProfilePage(),
          ProjectsPage(),
          RepoPage(),
        ],
      ),
    );
  }
}
