import 'package:data_layout/data_layout.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

class ImplementAppStateGetXController extends GetxController {
  ImplementationPostsServices service = ImplementationPostsServices();

  @override
  void onInit() {
    super.onInit();
    getDataDioPostsList();
  }

  String errorMessage = '';
  bool hasError = false;
  bool isLoadingPostsList = false;
  bool buildContentList = true;
  List<Post> postsList = [];

  void updateBuildContentList() {
    buildContentList = !buildContentList;
    update();
  }

  Future<void> getDataDioPostsList() async {
    isLoadingPostsList = true;
    update();

    try {
      postsList = await service.getPostsList();
      print(postsList.length);
      update();
    } on DioError catch (error) {
      errorMessage =
          "Контент временно недоступен\nstatus ${error.response?.statusCode} DataDioPostsList";
      print('${error.message} ____ from getDataDioPostsList');
      hasError = true;
      isLoadingPostsList = false;
      update();
    }

    isLoadingPostsList = false;
    update();
  }

  Future<void> getRefreshListPosts() async {
    try {
      //обращение к слою данных за получением обновленного листа
      List<Post> newPostsList = await service.getPostsList();
      Set<Post> newData = {};
      int count = 0;

      for (var newPost in newPostsList) {
        if (postsList.contains(newPost)) {
          print('postsList.contains(newPost)');
        } else {
          count = newPostsList.indexOf(newPost);
          print(count);
          if (newPost.title == postsList[count].title) {
            postsList[count] = newPost;
            print('newPost.title == postsList[count].title');
          } else {
            postsList.removeAt(count);
            newData.add(newPost);
            print('newPost');
          }
        }
      }

      postsList = [...newData, ...postsList];

      update();
    } on DioError catch (error) {
      errorMessage =
          "Контент временно недоступен\nstatus ${error.response?.statusCode} RefreshListPosts";
      print('${error.message} ____ from getRefreshListPosts');
      hasError = true;
      isLoadingPostsList = false;
      update();
    }

//Если в ответе пришли новые посты, то мы помещаем их в начало списка.
// Если в ответе пришли посты, которые уже были, то мы должны обновить информацию о них.
  }
}
