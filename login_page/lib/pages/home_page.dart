import 'package:flutter/material.dart';
import 'package:login_page/controllers/home_controller.dart';
import 'package:login_page/models/post_model.dart';
import 'package:login_page/repositories/home_repository.dart';
import 'package:login_page/repositories/home_repository_imp.dart';
import 'package:login_page/repositories/home_repository_mock.dart';
import 'package:login_page/services/prefs_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();

    _controller.fath();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              PrefsService.logout();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (_) => true);
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _controller.posts,
        builder: (_, list, __) {
          return ListView.separated(
            itemCount: list.length,
            itemBuilder: (_, index) => ListTile(
              leading: Text(list[index].id.toString()),
              title: Text(list[index].title),
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/details', arguments: list[index]);
              },
            ),
            separatorBuilder: (_, __) => Divider(),
          );
        },
      ),
    );
  }
}
