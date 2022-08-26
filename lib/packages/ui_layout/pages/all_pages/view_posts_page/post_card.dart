import 'package:app_view_post_json/packages/business_layout/lib/business_layout.dart';
import 'package:app_view_post_json/packages/model/lib/model.dart';
import 'package:app_view_post_json/packages/ui_layout/pages/all_pages/about_post_page/about_post_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostCard extends StatelessWidget {
  int index;

  PostCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  ElevatedButton myAboutButton(
      {required ups, required selftext, required title}) {
    return ElevatedButton(
      onPressed: () {
        Get.to(
          () => AboutPostPage(
            ups: ups,
            selftext: selftext,
            title: title,
          ),
        );
      },
      child: Text('Подробнее'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        // shadowColor: Colors.black,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: GetBuilder<ImplementAppStateGetXController>(
          builder: (controller) {
            final post = controller.postsList[index];
            return Column(
              children: [
                if (post.thumbnail != "self")
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.0),
                        topLeft: Radius.circular(12.0)),
                    child: Image.network(
                      '${post.thumbnail}',
                      // 'assets/images/${widget.hotelsList.poster.toString()}}',
                      fit: BoxFit.cover,
                      height: controller.buildContentList
                          ? MediaQuery.of(context).size.width / 2
                          : MediaQuery.of(context).size.width / 4,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                controller.buildContentList
                    ? ListTile(
                        title: Text(post.title.toString()),
                        trailing: myAboutButton(
                          ups: post.ups,
                          selftext: post.selftext,
                          title: post.title,
                        ),
                      )
                    : Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    post.title.toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0)),
                                child: myAboutButton(
                                  ups: post.ups,
                                  selftext: post.selftext,
                                  title: post.title,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
