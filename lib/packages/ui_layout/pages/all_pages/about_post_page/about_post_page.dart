import 'package:app_view_post_json/packages/business_layout/lib/business_layout.dart';
import 'package:app_view_post_json/packages/ui_layout/widgets/app_bar.dart';
import 'package:app_view_post_json/packages/ui_layout/widgets/drawer/end_drawer_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPostPage extends StatelessWidget {
  static const id = '/about_post_page';

  int? ups = 0;
  String? selftext = '';

  String? title = '';

  AboutPostPage({Key? key, this.ups, this.selftext, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('about post', isButtonCheckContentList: false),
      endDrawer: MyEndDrawer(),
      // endDrawer: MyEndDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Text(
                    title!,
                    style: Theme.of(context).textTheme.headline6,
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("like ${ups!}"),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(selftext!),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: MyBottomNavigatorBar(),
    );
  }
}
