import 'package:book_reading_mobile_app/style/app_colors.dart';
import 'package:book_reading_mobile_app/style/app_style.dart';
import 'package:book_reading_mobile_app/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

enum DialogType { confirm, error, forceUpdate, info }

class AppCustomDialog extends StatefulWidget {
  final String? title;
  final String? content;
  final String? description;
  final DialogType type;
  final String? buttonOkText;
  final String? buttonCancelText;
  final VoidCallback? onOkButtonPressed;
  final VoidCallback? onCancelButtonPressed;
  final VoidCallback? onCloseButtonPressed;
  final bool isShowCloseButton;

  const AppCustomDialog(
      {Key? key,
      this.title,
      this.content,
      required this.description,
      required this.type,
      required this.buttonOkText,
      this.buttonCancelText,
      this.onOkButtonPressed,
      this.onCancelButtonPressed,
      this.onCloseButtonPressed,
      this.isShowCloseButton = true})
      : super(key: key);

  @override
  _AppCustomDialogState createState() => _AppCustomDialogState();
}

class _AppCustomDialogState extends State<AppCustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
          decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(16.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 15.0),
                    child: widget.isShowCloseButton && widget.type != DialogType.info
                        ? AppBar(
                            backgroundColor: AppColors.transparent,
                            elevation: 0.0,
                            automaticallyImplyLeading: false,
                            title: Text(
                              widget.title ?? '',
                              textAlign: TextAlign.center,
                              textScaleFactor: 1.0,
                              style: TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            centerTitle: true,
                            actions: [
                              widget.type == DialogType.forceUpdate
                                  ? Container()
                                  : IconButton(
                                      padding: EdgeInsets.zero,
                                      alignment: Alignment.centerRight,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      icon: SvgIconWidget(
                                        name: "assets/images/ic_dialog_close.svg",
                                        size: 28.0,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        if (widget.onCloseButtonPressed != null) {
                                          widget.onCloseButtonPressed!();
                                        } else {
                                          Navigator.of(context).pop();
                                        }
                                      }),
                            ],
                          )
                        : Container()),
                widget.type != DialogType.error
                    ? Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Text(
                          widget.content ?? '',
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      )
                    : Container(),
                widget.description != null
                    ? Padding(
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          widget.description ?? "",
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.0,
                          style: widget.type == DialogType.error ? AppStyles.styleSize16Regular : AppStyles.styleSecondaryRegularSize16,
                        ),
                      )
                    : Container(),
                widget.type == DialogType.confirm ? _buildDialogTwoButton(context) : _buildDialogOneButton(context)
              ],
            ),
          )),
    );
  }

  Widget _buildDialogOneButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: SizedBox(
          height: 44.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    if (widget.onOkButtonPressed != null) {
                      widget.onOkButtonPressed!();
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(widget.buttonOkText ?? "",
                      style: AppStyles.styleTextRegular
                          .copyWith(color: widget.type == DialogType.error ? AppColors.colorAppError : AppColors.colorAppNeutral),
                      textScaleFactor: 1.0),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.colorAppBackgroundNeutral,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                    side: BorderSide(width: 1.0, color: widget.type == DialogType.error ? AppColors.colorAppError : AppColors.colorTextPlaceholder),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildDialogTwoButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: SizedBox(
          height: 44.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    widget.onCancelButtonPressed?.call();
                  },
                  child: Text(
                    widget.buttonCancelText ?? '',
                    style: AppStyles.styleSize16RegularRed,
                    maxLines: 1,
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.colorAppNeutral,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                    side: BorderSide(width: 1.0, color: AppColors.colorAppError),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    widget.onOkButtonPressed?.call();
                  },
                  child: Text(
                    widget.buttonOkText ?? 'OK',
                    style: AppStyles.styleTextRegular.copyWith(color: AppColors.colorAppNeutral),
                    textScaleFactor: 1.0,
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.colorAppNeutral,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                    side: BorderSide(width: 1.0, color: AppColors.colorTextPlaceholder),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
