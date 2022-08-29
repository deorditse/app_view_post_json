import 'package:dio/dio.dart';
import 'package:model/model.dart';

class ImplementationPostsServices {
  Future<List<Post>> getPostsList() async {
    final response =
        await Dio().get('https://www.reddit.com/r/flutterdev/new.json');
    List children = response.data["data"]["children"];

    List posts = [];

    for (var element in children) {
      posts.add(element["data"]);
    }

    List<Post> postsList =
        posts.map<Post>((post) => Post.fromJson(post)).toList();

    return postsList;
  }
}
