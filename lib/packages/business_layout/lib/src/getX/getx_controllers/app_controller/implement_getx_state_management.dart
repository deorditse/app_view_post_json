import 'package:data_layout/data_layout.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class ImplementAppStateGetXController extends GetxController {
  ImplementationShoppingCardServices service =
      ImplementationShoppingCardServices();

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

  void getDataDioPostsList() async {
    isLoadingPostsList = true;
    update();

    try {
      postsList = await service.getPostsList();
      update();
    } on DioError catch (error) {
      errorMessage =
          "Контент временно недоступен\nstatus ${error.response?.statusCode}";
      print(error.message);
      hasError = true;
      isLoadingPostsList = false;
      update();
    }

    isLoadingPostsList = false;
    update();
  }
}
