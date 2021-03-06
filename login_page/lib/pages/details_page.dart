import 'package:flutter/material.dart';
import 'package:login_page/models/post_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostModel args = ModalRoute.of(context)!.settings.arguments as PostModel;
    return Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: Container(
          child: Padding(
              padding: EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(args.title,
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic)),
                  SizedBox(height: 24),
                  Text(
                    args.body,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    args.body,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    args.body,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text('Autor: ${args.userId} Materia: ${args.id}')
                ],
              )),
        ));
  }
}
