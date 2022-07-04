import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/controller/search_controller.dart';
import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:book_reading_mobile_app/screens/detail_book_screen/details_screen.dart';
import 'package:book_reading_mobile_app/screens/widget_home_screen/filter_screen.dart';
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
                    handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    sliver: SliverAppBar(
                      title: const Text(
                        "Tìm kiếm",
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: kProgressIndicator,
                      leading: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: kBlackColor,
                          size: 30,
                        ),
                      ),

                      floating: true,
                      snap: true,
                      pinned: true,
                      expandedHeight: 150.0,
                      forceElevated: innerBoxIsScrolled,
                      bottom: TabBar(
                        tabs: tabs.map((String name) => Tab(text: name)).toList(),
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        title: Stack(
                          children: [
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.visiblePassword,

                              //controller: controlPassword,
                              decoration: InputDecoration(
                                  hintStyle: const TextStyle(color: Colors.white),
                                  errorStyle: const TextStyle(fontSize: 10, height: 0.3),
                                  border: InputBorder.none,
                                  hintText: 'Tìm kiếm ...',
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  suffixIcon: GestureDetector(
                                      onTap: () async {
                                        await Get.to(
                                          FilterScreen(
                                            filterParam: filterParam,
                                          ),
                                        );
                                        //call api here
                                        Map<String, String> apiParam = filterParam.buildParams();
                                      },
                                      child: const Icon(Icons.filter_list_outlined, color: Colors.white70, size: 30,))),
                            ),
                          ],
                        ),
                      ),
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
                              handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
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
