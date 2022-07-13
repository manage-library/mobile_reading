import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/controller/vip_update_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../style/app_colors.dart';
import '../style/app_style.dart';

class QrCodePage extends StatelessWidget {
  final VipUpdateController controller = Get.put(VipUpdateController());

  QrCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            final result = Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: kBlackColor,
            size: 30,
          ),
        ),
        title: const Text(
          "Thanh toán",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(border: Border.all(color: AppColors.primaryColor)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  QrImage(
                    data: "2|99|0941716670|0941716670|neucodethi@gmail.com|0|0|100000",
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
                    child: Text(
                      'Sử dụng App Momo hoặc sử dụng Camera hỗ trợ QR code để quét mã',
                      style: AppStyles.styleSize16SemiBoldClever.copyWith(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text('Nội dung chuyển tiền', style: AppStyles.styleSize16SemiBoldClever.copyWith(color: Colors.black)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Text(
                  '${controller.code.value}',
                  //   controller.currentUser.value?.cardId ?? '',
                  style: AppStyles.styleSize16SemiBoldClever,
                ),
              ),
              Container(
                width: 110,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.copy)),
                    Flexible(
                      child: Center(
                        child: Text(
                          'Sao chép',
                          style: AppStyles.styleSize16SemiBoldClever.copyWith(color: AppColors.whiteColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          Text(
            'Chú ý: ',
            style: AppStyles.styleSize16SemiBoldClever.copyWith(color: AppColors.redColor),
          ),
          Text(
            '- Nhập đúng nội dung chuyển tiền, chúng tôi không chịu trách nhiệm với câc trường hợp'
            ' sai.',
            style: AppStyles.styleSize16SemiBoldClever.copyWith(color: AppColors.redColor),
          ),
          Obx(
            () => Text("- Giao dịch chuyển tiền phải có nội dung là '${controller.code.value}'.",
                textAlign: TextAlign.justify,
                style: AppStyles.styleSize16SemiBoldClever.copyWith(color: AppColors.redColor)),
          ),
          Text(
              'Tuyệt đối không nhắn tin nội dung chuyển tiền vào số điện thoại và trong mục tin nhắn'
              ' của app Momo.',
              textAlign: TextAlign.justify,
              style: AppStyles.styleSize16SemiBoldClever.copyWith(color: AppColors.redColor)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text('Tài khoản nhận tiền : 0941716670 ',
                style: AppStyles.styleSize16SemiBoldClever.copyWith(color: AppColors.blackColor)),
          ),
          Text('Tên chủ khoản : Phạm Doãn Hiếu',
              style: AppStyles.styleSize16SemiBoldClever.copyWith(color: AppColors.blackColor)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Obx(() => Text('Số tiền cần chuyển: ${controller.fee.value[controller.selectedIndex.value]}00 đồng',
                style: AppStyles.styleSize16SemiBoldClever.copyWith(color: AppColors.blackColor))),
          ),
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
        ]),
      ),
    );
  }
}
