import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants.dart';
import '../../style/app_colors.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({Key? key, required this.filterParam}) : super(key: key);
  FilterParam filterParam;

  @override
  Widget build(BuildContext context) {
    TextEditingController bookName = TextEditingController(text: filterParam.bookName);
    TextEditingController authorName = TextEditingController(text: filterParam.authorName);
    final FilterParam currentFilterParamChanged = FilterParam.copy(filterParam);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bộ lọc', style: TextStyle(color: AppColors.colorTextSubTitleClever)),
        elevation: 0,
        backgroundColor: Colors.transparent,
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text('Trạng thái phát hành', style: TextStyle(color: AppColors.colorTextSubTitleClever)),
              const SizedBox(
                height: 10,
              ),
              GroupFilterButton(
                enumList: FilterReleaseStatus.values.toList(),
                initIndex: filterParam.releaseStatus.getIndex(),
                onParamSelected: (param) {
                  if (param != null) {
                    currentFilterParamChanged.releaseStatus = param;
                  } else {
                    currentFilterParamChanged.releaseStatus = FilterReleaseStatus.empty;
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              const Text('Sắp xếp theo', style: TextStyle(color: AppColors.colorTextSubTitleClever)),
              const SizedBox(
                height: 10,
              ),
              GroupFilterButton(
                enumList: FilterSortBy.values.toList(),
                initIndex: filterParam.sortBy.getIndex(),
                onParamSelected: (param) {
                  if (param != null) {
                    currentFilterParamChanged.sortBy = param;
                  } else {
                    currentFilterParamChanged.sortBy = FilterSortBy.empty;
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              const Text('Kiểu sắp xếp', style: TextStyle(color: AppColors.colorTextSubTitleClever)),
              const SizedBox(
                height: 10,
              ),
              GroupFilterButton(
                enumList: FilterSortType.values.toList(),
                initIndex: filterParam.sortType.getIndex(),
                onParamSelected: (param) {
                  if (param != null) {
                    currentFilterParamChanged.sortType = param;
                  } else {
                    currentFilterParamChanged.sortType = FilterSortType.empty;
                  }
                },
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                child: const Text('Tìm kiếm',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
                onPressed: () {
                  filterParam.copyFilterParam(currentFilterParamChanged);
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(32))),
                    backgroundColor: MaterialStateProperty.all(AppColors.colorButtonSearch),
                    minimumSize: MaterialStateProperty.all(Size(Get.width - 40, 54))),
              ),
              const SizedBox(
                height: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GroupFilterButton extends StatefulWidget {
  const GroupFilterButton({Key? key, required this.enumList, required this.onParamSelected, required this.initIndex})
      : super(key: key);
  final List<dynamic> enumList;
  final Function(dynamic) onParamSelected;
  final int initIndex;

  @override
  State<GroupFilterButton> createState() => _GroupFilterButtonState();
}

class _GroupFilterButtonState extends State<GroupFilterButton> {
  late int indexSelected = widget.initIndex;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: widget.enumList
          .skip(1)
          .map((e) => GestureDetector(
                onTap: () => setState(() {
                  if (indexSelected == FilterParamWrapper.getIndex(e)) {
                    indexSelected = 0;
                    widget.onParamSelected(null);
                  } else {
                    indexSelected = FilterParamWrapper.getIndex(e);
                    widget.onParamSelected(e);
                  }
                }),
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: indexSelected == FilterParamWrapper.getIndex(e)
                              ? AppColors.colorSelectedFilter
                              : AppColors.colorTextSubTitle,
                          width: 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: indexSelected == FilterParamWrapper.getIndex(e)
                          ? AppColors.colorSelectedFilter
                          : Colors.white,
                    ),
                    margin: EdgeInsets.only(
                        right: (FilterParamWrapper.getIndex(e).toInt() % 2 == 1) ? 10 : 0,
                        left: (FilterParamWrapper.getIndex(e).toInt() % 2 == 1) ? 0 : 10),
                    child: Center(
                        child: Text(
                      FilterParamWrapper.parseTitle(e),
                      style: TextStyle(
                          color: indexSelected == FilterParamWrapper.getIndex(e) ? Colors.white : Colors.black87,
                          fontSize: 17),
                    )),
                  ),
                ),
              ))
          .toList(),
    );
  }
}

abstract class FilterParamWrapper {
  static String parseParam(dynamic filerParamEnum) {
    if (filerParamEnum is FilterReleaseStatus) {
      return (filerParamEnum as FilterReleaseStatus).parseParam();
    } else if (filerParamEnum is FilterSortBy) {
      return (filerParamEnum as FilterSortBy).parseParam();
    } else {
      return (filerParamEnum as FilterSortType).parseParam();
    }
  }

  static String parseTitle(dynamic filerParamEnum) {
    if (filerParamEnum is FilterReleaseStatus) {
      return (filerParamEnum as FilterReleaseStatus).parseTitle();
    } else if (filerParamEnum is FilterSortBy) {
      return (filerParamEnum as FilterSortBy).parseTitle();
    } else {
      return (filerParamEnum as FilterSortType).parseTitle();
    }
  }

  static int getIndex(dynamic filerParamEnum) {
    if (filerParamEnum is FilterReleaseStatus) {
      return (filerParamEnum as FilterReleaseStatus).getIndex();
    } else if (filerParamEnum is FilterSortBy) {
      return (filerParamEnum as FilterSortBy).getIndex();
    } else {
      return (filerParamEnum as FilterSortType).getIndex();
    }
  }
}

enum FilterReleaseStatus { empty, releasing, released }

extension FilterReleaseStatusParsingEx on FilterReleaseStatus {
  String parseParam() {
    switch (this) {
      case FilterReleaseStatus.empty:
        return '';
      case FilterReleaseStatus.releasing:
        return '1';
      case FilterReleaseStatus.released:
        return '2';
    }
  }

  String parseTitle() {
    switch (this) {
      case FilterReleaseStatus.empty:
        return '';
      case FilterReleaseStatus.releasing:
        return 'Đang hoàn thành';
      case FilterReleaseStatus.released:
        return 'Đã hoàn thành';
    }
  }

  int getIndex() {
    switch (this) {
      case FilterReleaseStatus.empty:
        return 0;
      case FilterReleaseStatus.releasing:
        return 1;
      case FilterReleaseStatus.released:
        return 2;
    }
  }
}

enum FilterSortBy { empty, like, view, updateTime }

extension FilterSortByParsingEx on FilterSortBy {
  String parseParam() {
    switch (this) {
      case FilterSortBy.empty:
        return '';
      case FilterSortBy.like:
        return '1';
      case FilterSortBy.view:
        return '2';
      case FilterSortBy.updateTime:
        return '3';
    }
  }

  String parseTitle() {
    switch (this) {
      case FilterSortBy.empty:
        return '';
      case FilterSortBy.like:
        return 'Lượt yêu thích';
      case FilterSortBy.view:
        return 'Lượt xem';
      case FilterSortBy.updateTime:
        return 'Thời gian cập nhật';
    }
  }

  int getIndex() {
    switch (this) {
      case FilterSortBy.empty:
        return 0;
      case FilterSortBy.like:
        return 1;
      case FilterSortBy.view:
        return 2;
      case FilterSortBy.updateTime:
        return 3;
    }
  }
}

enum FilterSortType { empty, asc, desc }

extension FilterSortTypeParsingEx on FilterSortType {
  String parseParam() {
    switch (this) {
      case FilterSortType.empty:
        return '';
      case FilterSortType.asc:
        return 'asc';
      case FilterSortType.desc:
        return 'desc';
    }
  }

  String parseTitle() {
    switch (this) {
      case FilterSortType.empty:
        return '';
      case FilterSortType.asc:
        return 'Tăng dần';
      case FilterSortType.desc:
        return 'Giảm dần';
    }
  }

  int getIndex() {
    switch (this) {
      case FilterSortType.empty:
        return 0;
      case FilterSortType.asc:
        return 1;
      case FilterSortType.desc:
        return 2;
    }
  }
}

class FilterParam {
  String bookName;
  String authorName;
  int categoryId;
  bool isVip;
  FilterReleaseStatus releaseStatus;
  FilterSortBy sortBy;
  FilterSortType sortType;

  FilterParam(
      {this.bookName = '',
      this.authorName = '',
      this.categoryId = 1,
      this.isVip = false,
      this.releaseStatus = FilterReleaseStatus.empty,
      this.sortBy = FilterSortBy.empty,
      this.sortType = FilterSortType.empty});

  FilterParam.copy(FilterParam param)
      : bookName = param.bookName,
        authorName = param.authorName,
        categoryId = param.categoryId,
        isVip = param.isVip,
        releaseStatus = param.releaseStatus,
        sortBy = param.sortBy,
        sortType = param.sortType;

  void copyFilterParam(FilterParam param) {
    bookName = param.bookName;
    authorName = param.authorName;
    categoryId = param.categoryId;
    isVip = param.isVip;
    releaseStatus = param.releaseStatus;
    sortBy = param.sortBy;
    sortType = param.sortType;
  }

  Map<String, String> buildParams() {
    return {
      'bookName': bookName,
      'authorName': authorName,
      'categoryId': categoryId.toString(),
      'isVip': isVip.toString(),
      'releaseStatus': releaseStatus.parseParam(),
      'sortBy': sortBy.parseParam(),
      'sortType': sortType.parseParam()
    };
  }
}
