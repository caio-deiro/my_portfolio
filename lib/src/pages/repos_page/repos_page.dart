import 'package:app_miscelanea/src/pages/repos_page/repos_controller.dart';
import 'package:app_miscelanea/src/pages/repos_page/repository/github_repository_imp.dart';
import 'package:app_miscelanea/src/shared/widgets/app_base.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoPage extends StatefulWidget {
  const RepoPage({Key? key}) : super(key: key);

  @override
  State<RepoPage> createState() => _RepoPageState();
}

class _RepoPageState extends State<RepoPage> {
  @override
  void initState() {
    if (controller.repoList.isEmpty) {
      controller.getRepos();
    }
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    super.dispose();
  }

  final controller = ReposController(GithubRepositoryImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBase(
          title: 'Repositórios',
          child: controller.loading == true
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  separatorBuilder: (context, _) => Divider(),
                  itemCount: controller.repoList.length,
                  itemBuilder: (context, index) {
                    var gitRepos = controller.repoList[index];
                    return Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ListTile(
                        title: Text(
                          gitRepos.name ?? '',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/profile.jpg'),
                        ),
                        trailing: Text(gitRepos.language ?? ''),
                        subtitle: Text(
                          gitRepos.description ?? '',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        onTap: () {
                          launchUrl(
                            Uri.parse(gitRepos.html_url ?? ''),
                            mode: LaunchMode.externalApplication,
                          );
                        },
                      ),
                    );
                  })),
    );
  }
}
