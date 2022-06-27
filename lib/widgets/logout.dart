import 'package:book_reading_mobile_app/style/app_colors.dart';
import 'package:book_reading_mobile_app/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Bạn có chắc chắn muốn đăng xuất?",
              style: AppStyles.styleTextTitleMethod.copyWith(color: AppColors.colorTextTitleMethodClever)
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)
                )
              ),
              backgroundColor: MaterialStateProperty.all(
                  AppColors.colorDepositIcon
              ),
              minimumSize: MaterialStateProperty.all(
                Size(Get.width - 40, 54)
              )
            ),
              onPressed: (){
              
              },
              child: Text(
                  "Đồng ý",
                  style: AppStyles.styleTextTitleMethod.copyWith(color: AppColors.colorTextTitleMethod)
              ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)
                    )
                ),
                backgroundColor: MaterialStateProperty.all(
                  AppColors.colorDepositIcon.withOpacity(0.05),
                ),
                minimumSize: MaterialStateProperty.all(
                    Size(Get.width - 40, 54)
                )
            ),
            onPressed: () => Get.back(),
            child: Text(
                "Hủy",
                style: AppStyles.styleTextTitleMethod.copyWith(color: AppColors.colorDepositIcon)
            ),
          ),
        ],
      ),
    );
  }

}