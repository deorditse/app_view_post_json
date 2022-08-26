import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

import '../../data_layout.dart';
import '../api/storage_test.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement
//при использовании пакета freezed будет реализовано
//регистрируем как LazySingleton (одиночный) но вытаскиваем по запросу ShoppingData
class ImplementationShoppingCardServices {
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
