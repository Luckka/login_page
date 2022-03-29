import 'package:login_page/models/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getData();
}
