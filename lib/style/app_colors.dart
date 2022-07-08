import 'package:flutter/material.dart';

class AppColors {

  static const Color colorAppError = Color(0xFFCF202F);
  static const Color colorAppSuccess = Color(0xFF129961);
  static const Color colorAppWarning = Color(0xFFF7931A);
  static const Color colorAppNeutral = Color(0xFFA19F9D);

  static Color colorAppBackgroundError = const Color(0xFFF58791).withAlpha(20);
  static Color colorAppBackgroundSuccess =
      const Color(0xFF5FD255).withAlpha(20);
  static Color colorAppBackgroundWarning =
      const Color(0xFFDD7D00).withAlpha(20);
  static Color colorAppBackgroundNeutral =
      const Color(0xFF000000).withAlpha(10);

  static Color colorOverlayLight = const Color(0xFFFFFFFF).withAlpha(40);
  static Color colorOverlayLighter = const Color(0xFFFFFFFF).withOpacity(0.7);
  static Color colorOverLay = const Color(0xFFFFFFFF);
  static Color colorOverlayDark = const Color(0xff0A0B0D)
      .withOpacity(0.8); //const Color(0xff000000).withAlpha(40);

  static const Color colorCoinLyn = Color(0xff3289FF);
  static const Color colorCoinBTC = Color(0xffF7931A);
  static const Color colorCoinETH = Color(0xff6685FF);
  static const Color colorCoinBNB = Color(0xffF4BB27);
  static const Color colorCoinUSDT = Color(0xff26A17B);
  static const Color colorCoinUSDC = Color(0xff2775C9);
  static const Color colorCoinCLM = Color(0xff63C7CE);
  static const Color colorCoinBUSD = Color(0xffF4BB27);

  // optional

  static const Color colorAppFocus = Color(0xff0151FC);
  static const Color colorAppUnFocus = Color(0xff8E9399);

  static const Color colorDarkBackground = Color(0xFF31353E);

  static const Color colorTextContrast = Colors.white;
  static const Color colorTextHint = Color(0xFFA19F9D);
  static const Color colorSeparateLineDefault =
  Color(0xFFECECEC); //Color(0xFFD2D0CE);
  static const Color colorGrayBackground = Color(0xFFEFEFEF);

  static const Color colorBorderDefault = Color(0xffD2D0CE);

  static const Color colorBackgroundIconHistory = Color(0xfff0eff5);
  static const Color colorLightGray = Color(0xffD2D0CE);
  static const Color colorTextPlaceholder = Color(0xffA19F9D);

  static const Color textFieldFocusColor = Color(0xff2050F6);
  static const Color textFieldHelperColor = Color(0xff666666);

  static const Color buttonDisabledColor = Color(0xFFECECEC);
  static const Color buttonTextColor = Colors.white;

  static const Color roundTokenShadowColor = Color(0xff200e32);
  static const Color accountSettingIconBackground = Color(0xffFAFAFA);

  static Color colorFromHex(String hexString, {String alphaChannel = 'FF'}) {
    return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
  }

  static const Color colorTextSubTitle = Color(0xff999999);
  static const Color colorTextTitleMethod = Color(0xffECECEC);
  static const Color colorBackgroundAuthenticationMethod = Color(0xFF21242A);
  static Color colorBackgroundIconMarketPlace =
      const Color(0xFF151718).withOpacity(0.5);
  static const Color backgroundSearch = Color(0xFF1B1D1F);
  static const Color backgroundIconNFT = Color(0xff151718);
  static const Color colorNftItemFavourite = Color(0xffFF3366);
  static const Color roundedBackgroundButton = Color(0xff151718);
  static const Color defaultAvatarColor = Color(0xff86888B);


  static const Color walletCLMBackground = Color(0xFF31B6B5);

  static const Color colorTextTitleMethodClever = Color(0xff151718);
  static const Color colorOverlayDarkClever = Color(0xff151718);
  static const Color colorPrimaryGradientClever = Color(0xffECECEC);
  static Color backgroundIconNFTClever = const Color(0xff151718).withOpacity(0.5);
  static const Color colorTextSubTitleClever = Color(0xff5B616E);
  static const Color colorLightBackgroundClever = Color(0xffECECEC);
  static Color colorTextDisableClever = const Color(0xFF89909E);
  static const Color colorBorderTextPickerClever = Color(0xffDBDBDB);
  static Color brightGrayWeekend = const Color(0xFFEBEBF5).withOpacity(0.3);
  static Color colorTextContrastClever = const Color(0XFF151718);

  static const Color colorDepositIcon = Color(0xFF129961);
  static const Color colorWithdrawIcon = Color(0xFFCF202F);
  static const Color colorTransferIcon = Color(0xFFFD8F00);
  static const Color colorBuyCLMIcon = Color(0xFF0151FC);
  static const Color colorIconHeaderAssetsDetail = Color(0xff5B616E);
  static const Color newColorBackgroundIcon = Color(0xffF3F2F1);
  static const Color colorSelectedFilter = Color.fromARGB(255, 241, 205, 200);
  static const Color colorButtonSearch = Color.fromARGB(255, 236, 164, 153);
   static const Color primaryColor = Color(0xffCE7A58);
  static const Color primaryColor2 = Color(0xffE94057);
  static const Color lightPrimaryColor = Color(0xfff57674);
  static const Color taxItemColor = Color(0xfff8ebe6);

  // static const Color logoThirdColor = Color.fromRGBO(233, 64, 87, 1);
  static const Color logoThirdColor = Color(0xffE94057);
  static const Color secondaryColor = Color(0xFFFFFFFF);
  static const Color thirdColor = Color(0xffc6c4c4);
  static const Color fourthColor = Color(0xFFe3f2fd);
  static const Color backgroundColor = paleGrey;
  static const Color paleGrey = Color(0xffF5F5F5);
  static const Color primaryTextColor = Color(0xffCE7A58);

  static const Color activeColor = Color(0xff4CAF50);
  static const Color accentColor = Color(0xff80D321);
  static const Color highLightColor = Color(0xff80D321);
  static const Color blueColor = Color(0xff2196F3);
  static const Color lightBlueColor = Color(0xffcac9ff);
  static const Color greyColor = Color(0xffe8e8e8);
  static const Color greyBackGroundColor = Color(0xffF5F5F5);
  static const Color darkGreyColor = Color(0xff797979);
  static const Color hintTextColor = Color(0xff828282);
  static const Color lightGreyColor = Color(0x00000033);
  static const Color dividerColor = Color(0xFFE0E0E0);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color textColor = Color(0xFF000000);
  static const Color trackColor = Color(0xfffd7e7e);
  static const Color transparent = Colors.transparent;
  static const Color redColor = Color(0xffd14638);
  static const Color likeBlueColor = Color(0xff6d94ec);
  static const Color labelColor = Color(0xFF7A7A7A);
  static const Color redNotiColor = Color(0xffFF5252);
  static const Color greyNotiColor = Color(0xff9F9FA0);
  static const Color dialogButtonColor = Color(0xff0AB4FF);
  static const Color memoDividerColor = Color(0xffEBEBEB);
  static const Color facebookColor = Color(0xff3b5998);
  static const Color premiumColor = Color.fromRGBO(227, 164, 65, 1);
  static const Color borderColor = Color(0xffC9CDCF);
  static const Color iconTaxColor = Color(0xffce7a58);
}
