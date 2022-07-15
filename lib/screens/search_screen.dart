import 'dart:math';

import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/controller/base_controller.dart';
import 'package:book_reading_mobile_app/controller/search_controller.dart';
import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:book_reading_mobile_app/screens/detail_book_screen/details_screen.dart';
import 'package:book_reading_mobile_app/screens/widget_home_screen/filter_screen.dart';
import 'package:book_reading_mobile_app/src/routes.dart';
import 'package:book_reading_mobile_app/widgets/reading_card_list.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:book_reading_mobile_app/widgets/svg_icon.dart';
import 'package:get/get.dart';
import 'package:loadmore/loadmore.dart';

import '../controller/home_controller.dart';
import '../core/util/alert_utils.dart';
import '../domain/entities/user.dart';
import '../event/favorite_change_event.dart';

class SearchScreen extends StatelessWidget {
  final double defaultPadding = 20;
  final double navigationBarExpandedHeight = 110;

  final double paddingFactor = 40;
  final double opacityFactor = 30;
  final double progressFactor = 50;

  final double searchBarMaxHeight = 48;
  final double searchBarMinHeight = 40;

  final double collapsedHeight = kToolbarHeight;
  final Duration navigationBarTitleAnimatedDuration = const Duration(milliseconds: 70);
  SearchScreen({Key? key}) : super(key: key);
  final SearchController controller = Get.put(SearchController());

  Rx<User?> currentUser = Get.find<HomeController>().userInfor;
  @override
  Widget build(BuildContext context) {
    FilterParam filterParam = FilterParam();
    return GetBuilder(
      init: controller,
      global: false,
      builder: (GetxController controllerSearch) {
        final List<String> tabs = <String>['Tác phẩm', 'Tác giả'];
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverLayoutBuilder(builder: (context, constraints) {
                  var progress = (constraints.scrollOffset / progressFactor > 1.0
                      ? 1.0
                      : constraints.scrollOffset / progressFactor);

                  final opacity =
                      constraints.scrollOffset / opacityFactor > 1.0 ? 1.0 : constraints.scrollOffset / opacityFactor;

                  final padding = progress * paddingFactor + defaultPadding;

                  final height =
                      ((1 - progress) * searchBarMaxHeight).clamp(searchBarMinHeight, searchBarMaxHeight).toDouble();
                  return SliverAppBar(
                    title: AnimatedOpacity(
                        opacity: min(1.0 - opacity, 1.0),
                        duration: navigationBarTitleAnimatedDuration,
                        child: Column(
                          children: [
                            AnimatedPadding(
                              padding: const EdgeInsets.only(left: 1, bottom: 0, right: 1),
                              duration: const Duration(milliseconds: 0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: const Color.fromARGB(255, 247, 239, 239),
                                ),
                                child: TextField(
                                  //   controller: bookName,
                                  onChanged: (text) {
                                    text.isNotEmpty
                                        ? controller.showClearButton.value = true
                                        : controller.showClearButton.value = false;
                                    controller.debounceCallBack(text);
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Tìm kiếm ...',
                                    hintStyle: TextStyle(color: Colors.black87, fontSize: 12),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
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
                    actions: [
                      GestureDetector(
                        onTap: () async {
                          await Get.to(
                            FilterScreen(
                              filterParam: filterParam,
                            ),
                          );
                          //call api here
                          Map<String, String> apiParam = filterParam.buildParams();
                          controller.getBookFilter(filterParam);
                        },
                        child: SvgIconWidget(
                          name: "assets/images/ic_filter.svg",
                          size: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      )
                    ],
                    floating: true,
                    snap: true,
                    pinned: true,
                    expandedHeight: navigationBarExpandedHeight,
                    elevation: 0,
                    centerTitle: true,
                    forceElevated: innerBoxIsScrolled,
                    bottom: TabBar(
                      controller: controller.tabController,
                      tabs: tabs.map((String name) => Tab(text: name)).toList(),
                    ),
                  );
                })
              ];
            },
            body: TabBarView(
              controller: controller.tabController,
              // These are the contents of the tab views, below the tabs.
              children: [
                TabSearchPage(
                  controller: controller,
                  showListView: true,
                ),
                TabSearchPage(
                  controller: controller,
                  showListView: true,
                )
                // Obx(() => controller.listFilterBook.isNotEmpty
                //     ? ListBookSortByName()
                //     : const Center(child: Text('Chưa có dữ liệu tìm kiếm'))),
                // Obx(() => controller.listFilterBook.isNotEmpty
                //     ? ListBookSortByName()
                //     : const Center(child: Text('Chưa có dữ liệu tìm kiếm'))),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TabSearchPage extends StatelessWidget {
  TabSearchPage({Key? key, required this.controller, required this.showListView}) : super(key: key);
  final SearchController controller;
  final bool showListView;

  Rx<User?> currentUser = Get.find<HomeController>().userInfor;

  @override
  Widget build(BuildContext context) {
    return Obx(() => RefreshIndicator(
          color: kProgressIndicator,
          onRefresh: () async {
            controller.loadData();
          },
          child: Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 15.0),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: controller.listFilterBook.value.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: ReadingListCard(
                    onTapFavorite: () {
                      controller.listFilterBook.elementAt(index)?.toggleFavourite();
                      Get.find<EventBus>().fire(BookFavoriteChangeEvent(controller.listFilterBook.elementAt(index)!));
                    },
                    book: controller.listFilterBook.elementAt(index) ?? Book(),

/*
if (currentUser.value!.is_vip_user == controller.bookWithCategory.value.is_vip) {
                            Get.toNamed(AppRoutes.detailBook, arguments: controller.bookWithCategory.value);
                          } else {
                            AlertUtils.showError(
                                titleError: 'Thông báo',
                                desc: 'Yêu cầu đăng kí Vip',
                                okButtonTitle: 'Thử lại',
                                onOkButtonPressed: () {
                                  Get.toNamed(AppRoutes.vipUpdate);
                                });
                          }
 */

                    pressDetails: () {
                      if (currentUser.value!.is_vip_user == controller.listFilterBook.elementAt(index)?.is_vip) {
                        Get.toNamed(AppRoutes.detailBook, arguments: controller.listFilterBook.elementAt(index));
                      } else {
                        AlertUtils.showError(
                            titleError: 'Thông báo',
                            desc: 'Yêu cầu đăng kí Vip',
                            okButtonTitle: 'Thử lại',
                            onOkButtonPressed: () {
                              Get.toNamed(AppRoutes.vipUpdate);
                            });
                      }
                      //    if(currentUser.value?.vip_id != 0 == controller.listFilterBook.elementAt(index)?.is_vip)
                    },
                    pressRead: () {
                      if (currentUser.value!.is_vip_user == controller.listFilterBook.elementAt(index)?.is_vip) {
                        Get.toNamed(AppRoutes.bookOverView, arguments: controller.listFilterBook.elementAt(index));
                      } else {
                        AlertUtils.showError(
                            titleError: 'Thông báo',
                            desc: 'Yêu cầu đăng kí Vip',
                            okButtonTitle: 'Thử lại',
                            onOkButtonPressed: () {
                              Get.toNamed(AppRoutes.vipUpdate);
                            });
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ));
  }
}
