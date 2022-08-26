import 'package:app_view_post_json/packages/business_layout/lib/business_layout.dart';
import 'package:app_view_post_json/packages/ui_layout/pages/all_pages/view_posts_page/post_card.dart';
import 'package:app_view_post_json/packages/ui_layout/widgets/app_bar.dart';
import 'package:app_view_post_json/packages/ui_layout/widgets/drawer/end_drawer_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewPostsPage extends StatelessWidget {
  static const id = '/view_posts_page';

  ViewPostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: MyEndDrawer(),
        appBar: myAppBar('posts flutter dev', isButtonCheckContentList: true),
        body: GetBuilder<ImplementAppStateGetXController>(
          builder: (controller) => RefreshIndicator(
            onRefresh: () => controller.getRefreshListPosts(),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (controller.isLoadingPostsList)
                    Center(child: CircularProgressIndicator(color: Colors.red)),
                  if (!controller.isLoadingPostsList && controller.hasError)
                    Center(child: Text(controller.errorMessage)),
                  if (!controller.isLoadingPostsList && !controller.hasError)
                    controller.buildContentList
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: controller.postsList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return
                                      // Text(controller.postsList[index].title);
                                      PostCard(
                                    index: index,
                                  );
                                }),
                          )
                        : Expanded(
                            child: GridView.builder(
                                itemCount: controller.postsList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (BuildContext context, int index) {
                                  return PostCard(
                                    index: index,
                                  );
                                }),
                          ),
                ],
              ),
            ),
          ),
        ));
  }
}
