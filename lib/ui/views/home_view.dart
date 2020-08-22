import 'package:demo_app/core/enums/viewstate.dart';
import 'package:demo_app/core/models/post.dart';
import 'package:demo_app/core/models/user.dart';
import 'package:demo_app/core/viewmodels/home_model.dart';
import 'package:demo_app/ui/shared/app_colors.dart';
import 'package:demo_app/ui/shared/text_styles.dart';
import 'package:demo_app/ui/shared/ui_helpers.dart';
import 'package:demo_app/ui/views/base_view.dart';
import 'package:demo_app/ui/views/post_view.dart';
import 'package:demo_app/ui/widgets/post_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: model.state == ViewState.Busy
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  UIHelper.verticalSpaceLarge(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Welcome ${Provider.of<User>(context).name}',
                      style: headerStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child:
                        Text('Here are all your posts', style: subHeaderStyle),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Expanded(child: getPostsUi(model.posts)),
                ],
              ),
      ),
    );
  }
}

Widget getPostsUi(List<Post> posts) => ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => PostListItem(
        post: posts[index],
        onTap: () {
          Navigator.pushNamed(context, PostView.routeName,
              arguments: posts[index]);
        },
      ),
    );
