import 'package:app_view_post_json/packages/business_layout/lib/business_layout.dart';
import 'package:app_view_post_json/packages/model/lib/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostCard extends StatefulWidget {
  int index;
  String title;
  String? thumbnail;

  PostCard({
    Key? key,
    required this.index,
    required this.title,
    this.thumbnail,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  ElevatedButton myAboutButton() {
    return ElevatedButton(
      onPressed: () {
        // Get.to(() => AboutView(hotel: widget.hotel));
      },
      child: Text('Подробнее'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: GetBuilder<ImplementAppStateGetXController>(
        builder: (controller) => Column(
          children: [
            if (widget.thumbnail != "self")
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.0),
                    topLeft: Radius.circular(12.0)),
                child: Image.network(
                  '${widget.thumbnail}',
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
                    title: Text(widget.title.toString()),
                    trailing: myAboutButton())
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
                                widget.title.toString(),
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
                            child: myAboutButton(),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
