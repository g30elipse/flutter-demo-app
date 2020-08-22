import 'package:demo_app/core/enums/viewstate.dart';
import 'package:demo_app/core/models/post.dart';
import 'package:demo_app/core/services/api.dart';
import 'package:demo_app/core/viewmodels/base_mode.dart';
import 'package:demo_app/locator.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Post> posts = [];

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
