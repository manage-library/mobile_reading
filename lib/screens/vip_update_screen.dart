import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/controller/vip_update_controller.dart';
import 'package:book_reading_mobile_app/style/app_colors.dart';
import 'package:book_reading_mobile_app/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class VipUpdatePage extends StatelessWidget {
  VipUpdateController controller = Get.put(VipUpdateController());
  VipUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kProgressIndicatorTextField,
      appBar: AppBar(
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
        title: const Text(
          "VIP upgrade",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: 350,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 32, left: 20, right: 20),
              itemCount: controller.vip.length,
              itemBuilder: (BuildContext context, int index) {
                return Obx(() => InkWell(
                      child: vipItem(
                          index: index,
                          total: controller.vip[index],
                          selected: controller.selectedIndex.value,
                          month: controller.month[index]),
                      onTap: () {
                        controller.selectedIndex.value = index;
                      },
                    ));
              },
            ),
          ),
          Obx(() => Positioned(
                top: 550,
                left: 110,
                child: Text('Số tiền cần chuyển: ${controller.fee.value[controller.selectedIndex.value]}',
                    style: AppStyles.styleSize16SemiBoldClever.copyWith(color: AppColors.blackColor)),
              )),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 32),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  TextButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(32))),
                        backgroundColor: MaterialStateProperty.all(AppColors.colorDepositIcon),
                        minimumSize: MaterialStateProperty.all(Size(Get.width - 40, 54))),
                    onPressed: () {
                      controller.postTransaction();
                    },
                    child: Text("Đồng ý",
                        style: AppStyles.styleTextTitleMethod.copyWith(color: AppColors.colorTextTitleMethod)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget vipItem({required int index, required int total, required int selected, required int month}) {
    return Column(
      children: [
        Container(
          height: 86,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 13,
                color: Color(0xFFD3D3D3).withOpacity(.40),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'VIP $total - $month tháng',
                  style: AppStyles.styleAppBarTitle.copyWith(color: AppColors.colorNftItemFavourite),
                ),
                Radio(
                    value: index,
                    groupValue: selected,
                    activeColor: AppColors.colorDepositIcon,
                    onChanged: (value) {
                      controller.selectedIndex.value = index;
                    })
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
    // return Container(
    //   height: 64,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Text(
    //           'VIP $total'
    //       ),
    //       Radio(
    //           value: index,
    //           groupValue: selected,
    //           activeColor: AppColors.colorDepositIcon,
    //           onChanged: (value){
    //
    //           })
    //     ],
    //   ),
    // );
  }
}
