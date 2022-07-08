import 'dart:io';
import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/style/app_colors.dart';
import 'package:book_reading_mobile_app/style/app_style.dart';
import 'package:book_reading_mobile_app/widgets/svg_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/util/functions.dart';

class CustomAvatar extends StatefulWidget {
  final String? fullName;
  final String? avatarUrl;
  final File? file;
  final String? asset;
  final Widget? assetWidget;
  final Function()? onTap;
  final double? sizeAvatar;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? padding;
  final double? borderRadius;
  final bool? showCameraIcon;
  final bool? isCircleAvatar;

  const CustomAvatar({
    Key? key,
    this.fullName = '',
    this.avatarUrl,
    this.file,
    this.asset,
    this.assetWidget,
    this.onTap,
    this.sizeAvatar,
    this.backgroundColor,
    this.borderColor,
    this.padding,
    this.borderRadius = 0,
    this.showCameraIcon = false,
    this.isCircleAvatar = true,
  }) : super(key: key);

  @override
  _CustomAvatarState createState() => _CustomAvatarState();
}

class _CustomAvatarState extends State<CustomAvatar> {
  String _getAvatarText() {
    return FunctionUtils.convertFullNameToAvatarText(widget.fullName);
  }

  @override
  Widget build(BuildContext context) {
    final newSizeAvatar = widget.sizeAvatar ?? 160.w;
    return InkWell(
      onTap: widget.onTap,
      child: Stack(children: [
        Container(
          height: newSizeAvatar,
          width: newSizeAvatar,
          decoration: BoxDecoration(
            border: Border.all(
              width: widget.padding ?? 0,
              color: widget.borderColor ?? widget.backgroundColor ?? Colors.white,
            ),
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: (widget.isCircleAvatar ?? false)
                ? BorderRadius.circular(80.w)
                : BorderRadius.circular(widget.borderRadius ?? 0),
            child: _buildAvatarWidget(newSizeAvatar),
          ),
        ),
        (widget.showCameraIcon ?? false)
            ? Positioned(
                // bottom: SpaceUtils.spaceSmall,
                // right: SpaceUtils.spaceSmall,
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(12),
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kProgressIndicatorTextField,
                      border: Border.all(color: Colors.white, width: 2)),
                  child: SvgIconWidget(name: 'assets/images/ic_camera.svg', color: Colors.black),
                ),
              )
            : const SizedBox()
      ]),
    );
  }

  Widget _buildAvatarWidget(num newSizeAvatar) {
    if (widget.file != null) {
      return Image.file(
        widget.file!,
        fit: BoxFit.cover,
      );
    }
    if (widget.avatarUrl != null && widget.avatarUrl!.isNotEmpty) {
      return CachedNetworkImage(
        cacheKey: widget.avatarUrl,
        imageUrl: widget.avatarUrl!,
        progressIndicatorBuilder: (context, url, downloadProgress) => Container(
            margin: EdgeInsets.all(32),
            child: CircularProgressIndicator(value: downloadProgress.progress, color: kProgressIndicator)),
        fit: BoxFit.cover,
        errorWidget: (context, url, error) {
          return const Icon(Icons.info);
        },
      );
    }

    if (widget.assetWidget != null) {
      return widget.assetWidget!;
    }
    if (widget.asset != null && widget.asset!.isNotEmpty) {
      return CachedNetworkImage(
        cacheKey: widget.asset,
        imageUrl: widget.asset!,
        fit: BoxFit.cover,
      );
    }
    return Container(
      color: _getAvatarText().isEmpty ? AppColors.greyBackGroundColor : AppColors.primaryColor,
      height: 80,
      width: 80,
      child: Center(
        child: _getAvatarText().isEmpty
            ? Icon(
                Icons.person,
                size: 60,
              )
            : Text(
                _getAvatarText(),
                style: AppStyles.styleTextSemiBold.copyWith(color: AppColors.secondaryColor),
              ),
      ),
    );
  }
}
