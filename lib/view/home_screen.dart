// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/general_controller.dart';
import 'package:newsapp/model/news_categories_model.dart';
import 'package:newsapp/widgets/loading_widget.dart';

import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  var _selectedIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Obx(
                      () => InkWell(
                        onTap: () {
                          _selectedIndex.value = 0;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _selectedIndex.value == 0
                                ? Colors.blue
                                : Colors.white,
                          ),
                          alignment: Alignment.center,
                          width: width * .25,
                          child: Text(
                            "Home",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    Obx(() => homeController.loading.value
                        ? Center(
                            child: isLoadingWidget(),
                          )
                        : Container(
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: homeController.newsCategories!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    _selectedIndex.value = index + 1;
                                  },
                                  child: Obx(
                                    () => Container(
                                      color: _selectedIndex.value == index + 1
                                          ? Colors.blue
                                          : Colors.white,
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: width * .3,
                                      child: Text(
                                        homeController
                                            .newsCategories![index].name!,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              _selectedIndex.value == index + 1
                                                  ? Colors.white
                                                  : Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )),
                  ],
                ),
              ),

              // Container(
              //   // height: 50,
              //   width: double.infinity,
              //   child: Row(
              //     children: [
              //       Obx(
              //         () => InkWell(
              //           onTap: () {
              //             _selectedIndex.value = 0;
              //           },
              //           child: Container(
              //             decoration: BoxDecoration(
              //               border: _selectedIndex.value != 0
              //                   ? Border.all()
              //                   : Border.all(
              //                       width: 3,
              //                       color: Colors.blue,
              //                     ),
              //             ),
              //             alignment: Alignment.center,
              //             height: 50,
              //             width: width * .25,
              //             child: Text(
              //               "Section 1",
              //               style: TextStyle(
              //                   fontSize: 20, fontWeight: FontWeight.w500),
              //             ),
              //           ),
              //         ),
              //       ),
              //       Obx(() => InkWell(
              //             onTap: () {
              //               _selectedIndex.value = 1;
              //             },
              //             child: Container(
              //               decoration: BoxDecoration(
              //                 border: _selectedIndex.value != 1
              //                     ? Border.all()
              //                     : Border.all(
              //                         width: 3,
              //                         color: Colors.blue,
              //                       ),
              //               ),
              //               alignment: Alignment.center,
              //               height: 50,
              //               width: width * .25,
              //               child: Text(
              //                 "Section 2",
              //                 style: TextStyle(
              //                     fontSize: 20, fontWeight: FontWeight.w500),
              //               ),
              //             ),
              //           )),
              //       Obx(
              //         () => InkWell(
              //           onTap: () {
              //             _selectedIndex.value = 2;
              //           },
              //           child: Container(
              //             decoration: BoxDecoration(
              //               border: _selectedIndex.value != 2
              //                   ? Border.all()
              //                   : Border.all(
              //                       width: 3,
              //                       color: Colors.blue,
              //                     ),
              //             ),
              //             alignment: Alignment.center,
              //             height: 50,
              //             width: width * .25,
              //             child: Text(
              //               "Section 3",
              //               style: TextStyle(
              //                   fontSize: 20, fontWeight: FontWeight.w500),
              //             ),
              //           ),
              //         ),
              //       ),
              //       Obx(() => InkWell(
              //             onTap: () {
              //               _selectedIndex.value = 3;
              //             },
              //             child: Container(
              //               decoration: BoxDecoration(
              //                 border: _selectedIndex.value != 3
              //                     ? Border.all()
              //                     : Border.all(
              //                         width: 3,
              //                         color: Colors.blue,
              //                       ),
              //               ),
              //               alignment: Alignment.center,
              //               width: width * .25,
              //               height: 50,
              //               child: Text(
              //                 "Section 4",
              //                 style: TextStyle(
              //                     fontSize: 20, fontWeight: FontWeight.w500),
              //               ),
              //             ),
              //           )),
              //     ],
              //   ),
              // ),

              Expanded(
                child: Obx(
                  () => _selectedIndex.value == 0
                      ? sectionOne()
                      : _selectedIndex.value == 1
                          ? sectionTwo()
                          : _selectedIndex.value == 2
                              ? sectionThree()
                              : _selectedIndex.value == 3
                                  ? sectionFour()
                                  : _selectedIndex.value == 4
                                      ? sectionFive()
                                      : _selectedIndex.value == 5
                                          ? sectionSix()
                                          : sectionSeven(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionOne() {
    return Obx(() => homeController.isLoading.value
        ? Center(child: isLoadingWidget())
        : Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  height: 350,
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 14.0,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: 15,
                            ),
                            height: 200,
                            child: Image.network(
                              homeController
                                  .generalNews!.data![index].featuredImage!,
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Text(
                              homeController.generalNews!.data![index].title!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "${homeController.generalNews!.data![index].updateDate!} /${homeController.generalNews!.data![index].updateTime!} ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                homeController
                                    .generalNews!.data![index].categoryName!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Share.share(
                                    "${homeController.generalNews!.data![index].shortUrl}",
                                  );
                                },
                                icon: Icon(
                                  Icons.share,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ));
  }

  Widget sectionTwo() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          height: 400,
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 4.0,
            child: Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    height: 200,
                    child: Image.network(
                      "https://cdn.pixabay.com/photo/2015/08/13/17/24/vintage-1950s-887272__340.jpg",
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Text(
                      "lorem ipsum sit amit , lorem ipsum sit amit , lorem ipsum sit amit ,  lorem ipsum sit amit , lorem ipsum sit amit , lorem ipsum sit amit , lorem ipsum sit amit , lorem ipsum sit amit , lorem ipsum sit amit ,   ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Date/Time",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Category",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget sectionThree() {
    return Container(
      child: Text("National Section ......"),
    );
  }

  Widget sectionFour() {
    return Container(
      child: Text("i am in section four ......"),
    );
  }

  Widget sectionFive() {
    return Container(
      child: Text("i am in section five ......"),
    );
  }

  Widget sectionSix() {
    return Container(
      child: Text("i am in section six ......"),
    );
  }

  Widget sectionSeven() {
    return Container(
      child: Text("i am in section seven ......"),
    );
  }
}
