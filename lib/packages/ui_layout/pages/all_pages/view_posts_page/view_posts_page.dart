import 'package:app_view_post_json/packages/business_layout/lib/business_layout.dart';
import 'package:app_view_post_json/packages/ui_layout/pages/all_pages/view_posts_page/post_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewPostsPage extends StatelessWidget {
  static const id = '/view_posts_page';

  ViewPostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          title: Text('Hotels'),
          toolbarHeight: 40,
          actions: [
            GetBuilder<ImplementAppStateGetXController>(
              builder: (controller) => IconButton(
                onPressed: () {
                  controller.buildContentList = !controller.buildContentList;
                },
                icon: controller.buildContentList
                    ? Icon(Icons.grid_view)
                    : Icon(Icons.list),
              ),
            ),
          ],
        ),
        body: GetBuilder<ImplementAppStateGetXController>(
          builder: (controller) => Container(
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
                                return Text(controller.postsList[index].title);

                                //   PostCard(
                                //   index: index,
                                //   buildContentList: controller.buildContentList,
                                //   title: controller.postsList[index].title,
                                //   thumbnail:
                                //       controller.postsList[index].thumbnail,
                                // );
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
                                  buildContentList: controller.buildContentList,
                                  title: controller.postsList[index].title,
                                  thumbnail:
                                      controller.postsList[index].thumbnail,
                                );
                              }),
                        ),
              ],
            ),
          ),
        ));
  }
}
