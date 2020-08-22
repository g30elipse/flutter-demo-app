import 'package:demo_app/core/enums/viewstate.dart';
import 'package:demo_app/core/models/comment.dart';
import 'package:demo_app/core/services/api.dart';
import 'package:demo_app/core/viewmodels/base_mode.dart';
import 'package:demo_app/locator.dart';

class CommentsModel extends BaseModel {
  Api _api = locator<Api>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}
