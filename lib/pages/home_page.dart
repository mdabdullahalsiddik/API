import 'package:api_and_getx/controller/user_data_controller.dart';
import 'package:api_and_getx/static/all_colors.dart';
import 'package:api_and_getx/static/all_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  UserDataController userDataController = Get.put(UserDataController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AllColors.greenColor,
          title: AllTexts.appbarText,
        ),
        body: GetBuilder<UserDataController>(
          builder: (controller) {
            return userDataController.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: userDataController.dataList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: AllColors.greenColor,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "ID : ${userDataController.dataList[index].id.toString()}"),
                              Text(
                                  "Name : ${userDataController.dataList[index].name.toString()}"),
                              Text(
                                  "Username : ${userDataController.dataList[index].username.toString()}"),
                              Text(
                                  "Email : ${userDataController.dataList[index].email.toString()}"),
                              Text(
                                  "Address : ${userDataController.dataList[index].address.toString()}"),
                              Text(
                                  "Phone : ${userDataController.dataList[index].phone.toString()}"),
                              Text(
                                  "Website : ${userDataController.dataList[index].website.toString()}"),
                              Text(
                                  "Company : ${userDataController.dataList[index].company.toString()}"),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
