import 'package:flutter/material.dart';

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
        title: const Text('Filter'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: bookName,
                onChanged: (text) => currentFilterParamChanged.bookName = bookName.text,
              ),
              TextField(
                controller: authorName,
                onChanged: (text) => currentFilterParamChanged.authorName = authorName.text,
              ),
              const Text('Release status'),
              const SizedBox(
                height: 20,
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
                height: 50,
              ),
              const Text('Sort by'),
              const SizedBox(
                height: 20,
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
                height: 50,
              ),
              const Text('Sort type'),
              const SizedBox(
                height: 20,
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
                child: Text('Confirm'),
                onPressed: () {
                  filterParam.copyFilterParam(currentFilterParamChanged);
                  Navigator.of(context).pop();
                },
              )
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
                      height: 30,
                      margin: EdgeInsets.only(
                          right: (FilterParamWrapper.getIndex(e).toInt() % 2 == 1) ? 10 : 0,
                          left: (FilterParamWrapper.getIndex(e).toInt() % 2 == 1) ? 0 : 10),
                      color: indexSelected == FilterParamWrapper.getIndex(e) ? Colors.red : Colors.blue,
                      child: Center(child: Text(FilterParamWrapper.parseTitle(e))),
                    )),
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
        return 'RELEASING';
      case FilterReleaseStatus.released:
        return 'RELEASED';
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
        return 'LIKE';
      case FilterSortBy.view:
        return 'VIEW';
      case FilterSortBy.updateTime:
        return 'UPDATE TIME';
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
        return 'ASC';
      case FilterSortType.desc:
        return 'DESC';
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
