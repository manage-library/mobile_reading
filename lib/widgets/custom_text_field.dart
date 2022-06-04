import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatefulWidget {
  final String? title;
  final String? text;
  final String? placeholder;
  final TextInputType? type;
  final bool isObscure;
  final bool showEye;
  final String? Function()? errorText;
  final bool isCapitalized;
  final TextInputAction textInputAction;
  final bool Function()? errorPredicate;
  final bool isRequired;
  final ValueChanged<String?>? textFieldDidChangeValue;
  final ValueChanged<String?>? textFieldEndEditing;
  final int? maxLength;
  final double? radius;
  final Color? placeholderColor;
  final bool isTextFieldDisabled;
  final TextEditingController? editingController;
  final bool? autoFocus;
  final TextStyle? titleStype;
  final bool isDecimalKeyboard;
  const CustomTextFormField({
    Key? key,
    this.title,
    this.type,
    this.isObscure = false,
    this.showEye = true,
    this.placeholder,
    this.textFieldDidChangeValue,
    this.textInputAction = TextInputAction.next,
    this.errorText,
    this.text,
    this.errorPredicate,
    this.isCapitalized = false,
    this.isRequired = true,
    this.textFieldEndEditing,
    this.maxLength,
    this.radius,
    this.placeholderColor,
    this.isTextFieldDisabled = false,
    this.editingController,
    this.autoFocus,
    this.titleStype,
    this.isDecimalKeyboard = false,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obcureText = true;
  late var shouldValidateDate = false;
  TextEditingController _controller = TextEditingController();
  late final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textFieldTitleContainer(),
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffDBDBDB), width: 1),
              color: const Color(0xffFAFAFA),
            ),
            child: Row(children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 16, right: widget.isObscure ? 0 : 12),
                child: TextFormField(
                scrollPadding:  EdgeInsets.only(
                                    bottom: Get.mediaQuery.viewPadding.bottom),
                 autofocus: widget.autoFocus ?? false,
                 enabled: !widget.isTextFieldDisabled, 
                 controller: _controller,             
                ),
              ),
            
              )
            ]),
          ),
        )
      ],
    );
  }

  Widget textFieldTitleContainer() {
    return widget.title != null
        ? Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: RichText(
              text: TextSpan(
                text: '',
                style: widget.titleStype ?? TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text: widget.title),
                  if (widget.isRequired)
                    TextSpan(
                      text: ' *',
                    )
                ],
              ),
            ),
          )
        : Container();
  }
}
