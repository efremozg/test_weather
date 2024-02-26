import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final void Function(String value) onChanged;
  final String? errorText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboard;
  final TextStyle? textStyle;
  final double? radius;
  final int maxLength;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final bool autofocus;
  final double? radiusOnlyLeft;
  final double? radiusOnlyRight;
  final double? height;
  final Color color;
  final bool enabled;

  final void Function(String? value)? onSubmitted;
  const TextInputField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.enabled = true,
    this.controller,
    this.errorText,
    this.textStyle,
    this.keyboard = TextInputType.text,
    this.radius = 20,
    this.obscureText = false,
    this.maxLength = 28,
    this.maxLines = 1,
    this.minLines,
    this.radiusOnlyLeft = 0,
    this.radiusOnlyRight = 0,
    this.color = const Color.fromARGB(33, 158, 158, 158),
    this.expands = false,
    this.autofocus = false,
    this.height = 34,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height,
            child: TextField(
              style: textStyle,
              enabled: enabled,
              autofocus: autofocus,
              textAlignVertical: TextAlignVertical.top,
              onSubmitted: onSubmitted,
              minLines: maxLines,
              expands: expands,
              maxLines: maxLines,
              inputFormatters: [
                LengthLimitingTextInputFormatter(maxLength),
              ],
              keyboardType: keyboard,
              controller: controller,
              onChanged: onChanged,
              obscureText: obscureText,
              decoration: InputDecoration(
                focusColor: color,
                hoverColor: color,
                fillColor: color,
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                filled: true,
                contentPadding: const EdgeInsets.only(
                    left: 10, right: 4, top: 8, bottom: 4),
                border: OutlineInputBorder(
                  borderRadius: radius != null
                      ? BorderRadius.circular(radius!)
                      : BorderRadius.only(
                          topLeft: Radius.circular(radiusOnlyLeft!),
                          bottomLeft: Radius.circular(radiusOnlyLeft!),
                          topRight: Radius.circular(radiusOnlyRight!),
                          bottomRight: Radius.circular(radiusOnlyRight!),
                        ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
