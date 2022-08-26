import 'package:app_view_post_json/packages/business_layout/lib/business_layout.dart';
import 'package:app_view_post_json/packages/ui_layout/widgets/drawer/end_drawer_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar myAppBar(String? title, {required bool isButtonCheckContentList}) =>
    AppBar(
      title: Text(title ?? 'flutterdev'),
      toolbarHeight: 40,
      leading: isButtonCheckContentList
          ? GetBuilder<ImplementAppStateGetXController>(
              builder: (controller) => IconButton(
                onPressed: () {
                  controller.updateBuildContentList();
                },
                icon: controller.buildContentList
                    ? Icon(Icons.grid_view)
                    : Icon(Icons.list),
              ),
            )
          : null,
      actions: [MyEndDrawer.openEndDrawer()],
    );
