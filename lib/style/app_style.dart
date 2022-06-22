import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyles {
  static double fontSizeMin = 10.0;
  static double fontSizeName = 22.0;

  static double fontSizeXS = 12.0;
  static double fontSizeSM = 14.0;
  static double fontSizeBase = 16.0;
  static double fontSizeL = 18.0;
  static double fontSizeXL = 20.0;
  static double fontSize2XL = 24.0;
  static double fontSize3XL = 30.0;
  static double fontSize4XL = 36.0;

  static const FontWeight fontWeightSemiBold = FontWeight.w600;
  static const FontWeight fontWeight500 = FontWeight.w500;
  static const FontWeight fontWeightRegular = FontWeight.w400;

  static double borderSizeNormal = 0.5;
  static double borderSizeTextField = 1.0;

  static const double paddingExtra = 30.0;
  static const double paddingNormal = 20.0;
  static const double paddingMedium = 15.0;
  static const double paddingMin = 10.0;
  static const double paddingDialog = 16.0;

  static const double buttonSizeDefaultWidth = 335.0;
  static double buttonSizeDefaultHeight = 44.0;

  static const double iconSizeDefault = 24.0;
  static const double iconSizeLogo = 70.0;
  static const double iconSizeAvatar = 60.0;
  static double appBarIconSize = 24.0;
  static double borderTextField = 6.0;

  static TextStyle styleTextHeader = TextStyle(
    fontSize: fontSize2XL,
    fontWeight: fontWeightSemiBold,
    color: AppColors.colorTextContrast,
  );
  static TextStyle styleTextXlTitle = TextStyle(
    fontSize: fontSizeXL,
    fontWeight: fontWeightSemiBold,
    color: AppColors.colorTextTitleMethodClever,
  );

  static TextStyle styleTexXLWithSemiBold = TextStyle(
    fontSize: fontSizeXL,
    fontWeight: fontWeightSemiBold,
    color: AppColors.colorTextTitleMethod,
  );

  static TextStyle styleTextTitle = TextStyle(
    fontSize: fontSizeXL,
    fontWeight: fontWeightSemiBold,
    color: AppColors.colorOverlayLight,
  );

  static TextStyle styleTextTitleRegular = TextStyle(
    fontSize: fontSizeXL,
    fontWeight: fontWeightRegular,
    color: AppColors.colorOverlayLight,
  );

  static TextStyle styleTextSemiBold = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightSemiBold,
    color: AppColors.colorOverlayLight,
  );

  static TextStyle styleTextTitleMethod = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightSemiBold,
    color: AppColors.colorTextTitleMethod,
  );

  static TextStyle styleTextRegular = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
    color: AppColors.colorOverlayLight,
  );

  static TextStyle styleTextItem = TextStyle(
    fontSize: fontSizeXS,
    fontWeight: fontWeightRegular,
    color: AppColors.colorOverlayLight,
  );
  static TextStyle styleTextTotal = TextStyle(
    fontSize: fontSizeXS,
    fontWeight: fontWeightRegular,
    color: AppColors.colorTextSubTitle,
  );
  static TextStyle styleTextValue = TextStyle(
    fontSize: fontSizeXS,
    fontWeight: fontWeightRegular,
    color: AppColors.colorTextSubTitle,
  );
  static TextStyle styleTextHint = TextStyle(
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
    color: AppColors.colorTextHint,
  );

  static TextStyle styleTextSub = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegular,
    color: AppColors.colorTextHint,
  );
  static TextStyle styleTextNFT = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegular,
    color: AppColors.colorTextSubTitle,
  );

  static TextStyle styleTextDescription =
      TextStyle(fontSize: fontSizeSM, fontWeight: fontWeightRegular, color: AppColors.colorOverlayLight);

  static TextStyle styleNumberFavorite =
      TextStyle(fontSize: fontSizeSM, fontWeight: fontWeightRegular, color: AppColors.colorTextSubTitleClever);

  static TextStyle styleNFTNumberFavorite = TextStyle(
      fontSize: fontSizeSM, fontWeight: fontWeightRegular, color: AppColors.colorBackgroundAuthenticationMethod);

  static TextStyle styleTextSmall = TextStyle(
    color: AppColors.colorOverlayLight,
    fontSize: fontSizeSM,
    fontWeight: fontWeightSemiBold,
  );

  static TextStyle styleTextMin = TextStyle(
    color: Colors.white,
    fontSize: fontSizeMin,
    fontWeight: fontWeightRegular,
  );

  static TextStyle styleTextInput = TextStyle(
    color: AppColors.colorOverlayLight,
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular, //
  );

  static TextStyle styleTextPlaceholder = TextStyle(
    color: AppColors.colorOverlayLight,
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
  );

  static TextStyle styleAppBarTitle = TextStyle(
    color: AppColors.colorOverlayLight,
    fontSize: fontSizeXL,
    fontWeight: fontWeightSemiBold,
  );

  static TextStyle styleAppBarTitleWhite = TextStyle(
    color: AppColors.colorTextContrast,
    fontSize: fontSizeXL,
    fontWeight: fontWeightRegular,
  );

  static TextStyle styleSize22SemiBold = TextStyle(
    color: AppColors.colorOverlayLight,
    fontSize: fontSizeName,
    fontWeight: fontWeightSemiBold,
  );

  static TextStyle styleSize16SemiBold = TextStyle(
    color: AppColors.colorOverlayLight,
    fontSize: fontSizeBase,
    fontWeight: fontWeightSemiBold,
  );

  static TextStyle styleSize16Regular = TextStyle(
    color: AppColors.colorOverlayLighter,
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
  );

  static TextStyle styleSize16RegularRed = TextStyle(
    color: AppColors.colorAppError,
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
  );

  static TextStyle styleTextInputError = TextStyle(
    color: AppColors.colorAppError,
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegular,
  );

  static TextStyle styleSecondaryRegularSize16 = TextStyle(
    color: AppColors.colorTextContrast,
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
  );

  static TextStyle styleSecondaryRegularSize14 = TextStyle(
    color: AppColors.colorOverlayLight,
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegular,
  );

  static TextStyle styleValueRegularSize14 = TextStyle(
    color: AppColors.colorTextTitleMethod,
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegular,
  );

  static TextStyle styleValueRegularSize14HyperLink = TextStyle(
    color: AppColors.colorOverlayLight,
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegular,
  );

  static TextStyle styleWhiteRegularSize14 = TextStyle(
    color: AppColors.colorOverlayLight,
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegular,
  );

  static TextStyle styleSize16RegularHyperlink = TextStyle(
    color: AppColors.colorOverlayLight,
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
  );

  static TextStyle styleTextPrimaryRegularSize30 = TextStyle(
    color: AppColors.colorOverlayLight,
    fontSize: fontSize3XL,
    fontWeight: fontWeightRegular,
  );

  static TextStyle styleTextHelperTextField = TextStyle(
    color: AppColors.textFieldHelperColor,
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegular,
  );
  static TextStyle styleTextSize12 = TextStyle(fontSize: AppStyles.fontSizeXS, color: AppColors.colorTextSubTitle);

  static TextStyle styleTextSize14 = TextStyle(
    fontSize: fontSizeSM,
    color: AppColors.colorOverlayLighter,
  );

  static TextStyle styleTextSize14WithOverlayLight =
      TextStyle(fontSize: fontSizeSM, color: AppColors.colorTextTitleMethod);

  static TextStyle styleTextSizeSM = TextStyle(
      fontSize: AppStyles.fontSizeMin, color: AppColors.colorTextContrast, fontWeight: AppStyles.fontWeightRegular);

  static TextStyle styleCounterAppbar = TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500);

  static TextStyle styleIconNFT = TextStyle(
      color: AppColors.colorOverlayLight, fontSize: AppStyles.fontSizeSM, fontWeight: AppStyles.fontWeightRegular);

  static TextStyle styleTextNFTPrice = TextStyle(
    fontSize: fontSizeXS,
    fontWeight: fontWeightRegular,
    color: AppColors.colorOverlayLight,
  );

  static TextStyle hyperLinkText = TextStyle(
      fontSize: AppStyles.fontSizeSM, fontWeight: AppStyles.fontWeightRegular, color: AppColors.colorOverlayLight);

  static TextStyle styleTextNFTBids = TextStyle(
    fontSize: fontSizeXS,
    fontWeight: fontWeightRegular,
    color: AppColors.colorOverlayLight,
  );

  static TextStyle styleTextTitleMethodClever = TextStyle(
    fontSize: fontSizeXL,
    fontWeight: fontWeightSemiBold,
    color: AppColors.colorTextTitleMethodClever,
  );

  static TextStyle styleSize16SemiBoldClever = TextStyle(
    color: AppColors.colorOverlayLight,
    fontSize: fontSizeBase,
    fontWeight: fontWeightSemiBold,
  );

  static TextStyle styleSize12RegularClever = TextStyle(
    color: AppColors.colorOverlayLight,
    fontSize: fontSizeXS,
    fontWeight: fontWeightRegular,
  );

  static TextStyle styleSize12SemiBoldClever = TextStyle(
    color: AppColors.colorOverlayLight,
    fontSize: fontSizeXS,
    fontWeight: fontWeightSemiBold,
  );

  static TextStyle styleTextRegularClever = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeightSemiBold,
    color: AppColors.colorOverlayLight,
  );

  static TextStyle styleTextHeaderClever = TextStyle(
    fontSize: fontSize2XL,
    fontWeight: fontWeightSemiBold,
    color: AppColors.colorTextContrastClever,
  );

  static const FontWeight fontWeightRegularClever = FontWeight.w600;

  static TextStyle styleTextInputClever = TextStyle(
    color: AppColors.colorOverlayLight, // 151718 if cleverme
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegularClever,
  );

  static const styleTextFieldClever = BorderSide(
    width: 1.0,
    color: Color(0xffdbdbdb),
  );

  static TextStyle styleTextPlaceholderClever = TextStyle(
    color: AppColors.colorTextDisableClever,
    fontSize: fontSizeBase,
    fontWeight: fontWeightRegular,
  );

  static TextStyle styleTextNFTClever = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegular,
    color: AppColors.colorTextSubTitleClever,
  );

  static TextStyle styleSecondarySemiBoldSize14Clever = TextStyle(
    color: AppColors.colorOverlayLight,
    fontSize: fontSizeSM,
    fontWeight: fontWeightSemiBold,
  );

  /*static TextStyle styleSecondaryRegularSize14Clever = TextStyle(
    color: AppColors.colorTextPrimary,
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegular,
  );*/

  static TextStyle styleFirstSemiBoldSize14Clever = TextStyle(
    color: AppColors.colorOverlayLight,
    fontSize: fontSizeSM,
    fontWeight: fontWeightRegular,
  );

  static TextStyle styleHighLightSemiBoldSize30Clever =
      TextStyle(color: AppColors.colorOverLay, fontSize: fontSize3XL, fontWeight: fontWeightSemiBold);
}
