import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:login_page/models/post_model.dart';
import 'package:login_page/repositories/home_repository.dart';

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<List<PostModel>> getData() async {
    var value = await rootBundle.loadString('assets/data.json');

    List postJson = jsonDecode(value);

    return postJson.map((e) => PostModel.fromJson(e)).toList();
  }
}
