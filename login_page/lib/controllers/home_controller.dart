import 'package:flutter/cupertino.dart';
import 'package:login_page/models/post_model.dart';
import 'package:login_page/repositories/home_repository.dart';

class HomeController {
  final HomeRepository homeRepository;

  HomeController(this.homeRepository);

  ValueNotifier<List<PostModel>> posts = ValueNotifier([]);

  fath() async {
    posts.value = await homeRepository.getData();
  }
}
