import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/controller/vip_update_controller.dart';
import 'package:book_reading_mobile_app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VipUpdatePage extends StatelessWidget {
  final VipUpdateController controller = Get.put(VipUpdateController());
  VipUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
          Scaffold(
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
          "Nâng cấp VIP",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Obx(() {
            print("rebuilt");
            return ListView.builder(
            padding: const EdgeInsets.only(top: 32, left: 20, right: 20),
            itemCount: controller.vip.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                    child:
                        vipItem(index: index, total: controller.vip[index], selected: controller.selectedIndex.value),
                    onTap: () {
                      controller.selectedIndex.value = index;
                    },
                  );
            },
          );
          }),
        ],
      ),
    );
 
   }

  Widget vipItem({required int index, required int total, required int selected}) {
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
                Text('VIP $total'),
                Radio(
                    value: index, groupValue: selected, activeColor: AppColors.colorDepositIcon, onChanged: (value) {
                      
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

    //           })
    //     ],
    //   ),
    // );
  }
}
