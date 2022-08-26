import 'package:app_view_post_json/packages/business_layout/lib/business_layout.dart';
import 'package:app_view_post_json/packages/ui_layout/pages/all_pages/about_post_page/about_post_page.dart';
import 'package:app_view_post_json/packages/ui_layout/pages/all_pages/view_posts_page/view_posts_page.dart';
import 'package:app_view_post_json/packages/ui_layout/style_app/theme_app/custom_theme/material_theme/dark_custom_theme_material.dart';
import 'package:app_view_post_json/packages/ui_layout/style_app/theme_app/custom_theme/material_theme/light_custom_theme_material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  // await Hive.initFlutter();
  // Services.sharedPrefs = await SharedPreferences.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyGetApp());
}

class MyGetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BasicsExampleBinding(),
      theme: themeLight,
      darkTheme: themeDark,
      themeMode: ThemeMode.system,
      initialRoute: ViewPostsPage.id,
      getPages: [
        GetPage(
          name: ViewPostsPage.id,
          page: () => ViewPostsPage(),
          binding: BasicsExampleBinding(),
        ),
        GetPage(
          name: AboutPostPage.id,
          page: () => AboutPostPage(),
          binding: BasicsExampleBinding(),
        ),
      ],
    );
  }
}
