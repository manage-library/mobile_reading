import 'package:book_reading_mobile_app/data/rest_api/repositories_impl/detail_repository_impl.dart';
import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:book_reading_mobile_app/screens/widget_home_screen/filter_screen.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:flutter/material.dart';

import '../domain/entities/category.dart';

class SearchController extends GetxController with GetSingleTickerProviderStateMixin {
  var listFilterBook = <Book?>[].obs;
  final _debounceTime = 800;

  Timer _debounce = Timer(const Duration(milliseconds: 0), () {});
  RxString searchParam = ''.obs;
  RxBool showRecentSearch = true.obs;
  RxBool showClearButton = false.obs;
  RxInt selectedIndex = 1.obs;
  late TabController tabController;
  RxString searchText = ''.obs;
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Tác giả'),
    Tab(text: 'Tác phẩm'),
  ];
  RxList<Category?> bookCategory = RxList();
  RxMap<String, int> listReadingBook = RxMap();



  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    getBookInCategory();
    // getCategory();
    tabController.addListener(() {
      selectedIndex.value = tabController.index;
    });
  }

  final DetailBookImpl _detailBookImpl = DetailBookImpl();
  void getBookInCategory() async {
    List<Book?> listBook = await _detailBookImpl.getBooks();
    listFilterBook.value = listBook;
  }

  void loadData() {
    getBookInCategory();
  }

  

  void debounceCallBack(String value) {
    if (_debounce.isActive) {
      _debounce.cancel();
    }
    _debounce = Timer(Duration(milliseconds: _debounceTime), () async {
      if (selectedIndex.value == 0) {
        listFilterBook.value = await _detailBookImpl.getBooks(bookName: value);
      } else {
        listFilterBook.value = await _detailBookImpl.getBooks(authorName: value);
      }
      searchText.value = value.trim();
    });
  }

  void getBookFilter(FilterParam filterParam) async {
    List<Book?> listBook = await _detailBookImpl.getBookFilter(filterParam: filterParam);
    // FilterParam.copyField(authorName : searchText.value)..buildParams());
    listFilterBook.value = listBook;
  }

    void getCategory() async {
    List<Category?> category = await _detailBookImpl.getCategory();
    bookCategory.value = category;
    
    for(int i = 0; i< category.length ; i++) {
       listReadingBook[category[i]!.name ?? ''] = category[i]?.id ?? 1;
    }
  }

  Rx<String?>? get getCategorySelected {
    return 'Văn học Việt Nam'.obs;
  }

  void updateCategory(Category? category){
    getCategorySelected?.value = category?.name;
    print(category?.id);
  }
}
