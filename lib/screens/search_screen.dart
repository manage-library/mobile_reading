import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/controller/search_controller.dart';
import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:book_reading_mobile_app/screens/detail_book_screen/details_screen.dart';
import 'package:book_reading_mobile_app/screens/widget_home_screen/filter_screen.dart';
import 'package:book_reading_mobile_app/style/app_colors.dart';
import 'package:book_reading_mobile_app/widgets/reading_card_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final SearchController controller = SearchController();
  @override
  Widget build(BuildContext context) {
    FilterParam filterParam = FilterParam();
    return GetBuilder(
      init: controller,
      global: false,
      builder: (GetxController controllerSearch) {
        final List<String> tabs = <String>['Tác phẩm', 'Tác giả'];
        return DefaultTabController(
          length: tabs.length, // This is the number of tabs.
          child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    sliver: SliverAppBar(
                        title: const Text(
                          "Tìm kiếm",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: kProgressIndicator,
                        leading: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        floating: true,
                        snap: true,
                        pinned: true,
                        expandedHeight: 180.0,
                        elevation: 0,
                        centerTitle: true,
                        forceElevated: innerBoxIsScrolled,
                        bottom: TabBar(
                          tabs: tabs.map((String name) => Tab(text: name)).toList(),
                        ),
                        flexibleSpace: Container(
                          color: kProgressIndicator,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(children: [
                              AnimatedPadding(
                                padding: EdgeInsets.only(left: 20, bottom: 0, right: 20, top: 100),
                                duration: const Duration(milliseconds: 0),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Color.fromARGB(255, 238, 217, 217),
                                  ),
                                  child: TextField(
                                    // controller: controlFullName,
                                    onChanged: (value) {
                                      //      signUpController.updateFullName(value);
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Tìm kiếm ...',
                                      hintStyle: TextStyle(color: Colors.black87, fontSize: 12),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                          ),
                        )

                        //  FlexibleSpaceBar(
                        //   title: Stack(
                        //     // fit: StackFit.expand,
                        //     children: [
                        //       Container(
                        //         alignment: Alignment.center,
                        //         height: 40,
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(40),
                        //           color: Color.fromARGB(255, 238, 217, 217),
                        //         ),
                        //         child: TextField(
                        //           // controller: controlFullName,
                        //           onChanged: (value) {
                        //             //      signUpController.updateFullName(value);
                        //           },
                        //           decoration: InputDecoration(
                        //             border: InputBorder.none,
                        //             hintText: 'Tìm kiếm ...',
                        //             hintStyle: TextStyle(color: Colors.black87, fontSize: 12),
                        //             contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        //           ),
                        //         ),
                        //       )
                        //       // Container(
                        //       //   height: 48,
                        //       //   width: 250,
                        //       //   child: TextField(
                        //       //     // controller: bookName,
                        //       //     onChanged: (text) => {},
                        //       //     decoration: const InputDecoration(
                        //       //       hintText: 'Tìm kiếm ...',
                        //       //       contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        //       //       hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                        //       //       //    label: Text("Nhập tên sách", style: TextStyle(color: Colors.white, fontSize: 12)),
                        //       //       enabledBorder: OutlineInputBorder(
                        //       //           borderRadius: BorderRadius.all(Radius.circular(10)),
                        //       //           borderSide: BorderSide(
                        //       //             color: Colors.white,
                        //       //             width: 0.5,
                        //       //           )),
                        //       //     ),
                        //       //   ),
                        //       // ),
                        //       // const SizedBox(
                        //       //   height: 20,
                        //       // ),
                        //       // TextFormField(
                        //       //   style: const TextStyle(color: Colors.white),
                        //       //   keyboardType: TextInputType.visiblePassword,

                        //       //   //controller: controlPassword,
                        //       //   decoration: InputDecoration(
                        //       //       hintStyle: const TextStyle(color: Colors.white),
                        //       //       errorStyle: const TextStyle(fontSize: 10, height: 0.3),
                        //       //       border: InputBorder.none,
                        //       //       hintText: 'Tìm kiếm ...',
                        //       //       contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        //       //       suffixIcon: GestureDetector(
                        //       //           onTap: () async {
                        //       //             await Get.to(
                        //       //               FilterScreen(
                        //       //                 filterParam: filterParam,
                        //       //               ),
                        //       //             );
                        //       //             //call api here
                        //       //             Map<String, String> apiParam = filterParam.buildParams();
                        //       //           },
                        //       //           child: const Icon(Icons.filter_list_outlined, color: Colors.white70, size: 30,))),
                        //       // ),
                        //     ],
                        //   ),
                        // ),

                        ),
                  ),
                ];
              },
              body: TabBarView(
                // These are the contents of the tab views, below the tabs.
                children: tabs.map((String name) {
                  return SafeArea(
                    top: false,
                    bottom: false,
                    child: Builder(
                      builder: (BuildContext context) {
                        return CustomScrollView(
                          key: PageStorageKey<String>(name),
                          slivers: <Widget>[
                            SliverOverlapInjector(
                              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                            ),
                            SliverPadding(
                              padding: const EdgeInsets.all(8.0),
                              sliver: SliverFixedExtentList(
                                itemExtent: 48.0,
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text('Item $index'),
                                    );
                                  },
                                  childCount: 30,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
