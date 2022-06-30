import 'package:book_reading_mobile_app/style/app_colors.dart';
import 'package:book_reading_mobile_app/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBottomSheet extends StatefulWidget{
  String? title;
  Widget? content;
  double contentSize;
  AppBottomSheet({
    this.title,
    this.content,
    required this.contentSize
  });

  @override
  State<StatefulWidget> createState() {
    return AppBottomSheetState();
  }

  void show(){
    Get.bottomSheet(this);
  }
}

class AppBottomSheetState extends State<AppBottomSheet>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.contentSize + 102,
      decoration: BoxDecoration(
        color: AppColors.colorOverLay,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
      ),
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: [
          Container(
            height: 60,
            child: Center(
              child: Text(
                widget.title ?? '',
                style: AppStyles.styleTextHeader.copyWith(color: AppColors.colorTextTitleMethodClever),
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color:AppColors.colorLightGray.withOpacity(0.5)
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: widget.contentSize,
            child: widget.content,
          )
        ],
      ),
    );
  }

}