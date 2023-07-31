import 'dart:convert';

import 'package:api_and_getx/api_data/uesr_data_service.dart';
import 'package:api_and_getx/models/user_information.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserDataController extends GetxController {
  late DataService dataService;
  bool loading = true;
  List<UserInformationModel> dataList = [];
  @override
  void onInit() {
    dataService = DataService();
    getUserData();
    super.onInit();
  }

  getUserData() async {
    try {
      loading = true;
      http.Response response = await dataService.getData();

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
     
        for (int index = 0; index <= data.length; index++) {
          dataList.add(UserInformationModel.fromJson(data[index]));
          loading = false;
        }
        update();
      }
    } catch (exception) {
      update();
      print(exception);
    }
  }
}
