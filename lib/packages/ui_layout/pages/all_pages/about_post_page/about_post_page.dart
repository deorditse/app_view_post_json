import 'package:app_view_post_json/packages/business_layout/lib/business_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPostPage extends StatefulWidget {
  static const id = '/about_post_page';

  AboutPostPage({Key? key}) : super(key: key);

  @override
  State<AboutPostPage> createState() => _AboutPostPageState();
}

class _AboutPostPageState extends State<AboutPostPage> {
  final controllerSetting = Get.find<ImplementSettingGetXController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: MyLeftDrawer.openLeftDrawer(),
        title: const Text('Новости'),
        // actions: [
        //   MyEndDrawer.openEndDrawer(),
        // ],
      ),
      // endDrawer: MyEndDrawer(),
      body: Center(
          child: Container(
        child: Text('NewsPage'),
      )),
      // bottomNavigationBar: MyBottomNavigatorBar(),
    );
  }
}
