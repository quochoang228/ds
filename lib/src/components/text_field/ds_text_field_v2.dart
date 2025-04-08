part of '../../../ds.dart';

class DsTextFieldV2 extends StatelessWidget {
  const DsTextFieldV2({
    super.key,
    required this.name,
    this.title,
    this.controller,
    this.hintText,
    this.initialValue,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
    this.isRequired = false,
    this.enabled = true,
    this.autofocus = false,
    this.obscureText = false,
    this.textInputType,
    this.maxLines,
    this.minLines = 1,
    this.maxLength,
    this.borderRadius,
    this.contentPadding,
    this.decoration,
    this.inputFormatters,
    this.onTap,
  });

  final TextEditingController? controller;
  final String name;
  final String? hintText;
  final String? initialValue;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function? onChanged;
  final String? Function(String?)? validator;
  final bool isRequired;
  final bool enabled;
  final bool autofocus;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextInputType? textInputType;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? inputFormatters;
  final String? title;

  /// On tap text field
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        title != null
            ? RichText(
                text: TextSpan(
                    text: title ?? '',
                    style: DSTextStyle.bodySmall
                        .medium()
                        .applyColor(DSCoreColors.neutral09),
                    children: [
                      TextSpan(
                        text: isRequired ? ' *' : '',
                        style: DSTextStyle.bodySmall
                            .medium()
                            .applyColor(DSCoreColors.red),
                      ),
                    ]),
              )
            : const SizedBox(),
        title != null ? const Gap(8) : const SizedBox(),
        InkWell(
          onTap: onTap,
          child: AbsorbPointer(
            absorbing: onTap != null,
            child: FormBuilderTextField(
              controller: controller,
              name: name,
              initialValue: initialValue,
              enabled: enabled,
              maxLines: maxLines,
              minLines: minLines,
              maxLength: maxLength,
              autofocus: autofocus,
              cursorColor: DSCoreColors.neutral09,
              obscureText: obscureText,
              onEditingComplete: () {},
              // onTap: onTap,
              onChanged: (value) {
                if (onChanged != null) {
                  onChanged!();
                }
              },
              validator: validator,
              // validator: FormBuilderValidators.required(
              //   checkNullOrEmpty: true,
              //   errorText: 'Trường bắt buộc',
              // ),

              decoration: decoration ??
                  InputDecoration(
                    hintText: hintText,
                    hintStyle: DSTextStyle.bodyMedium.applyColor(
                      DSCoreColors.neutral05,
                    ),
                    filled: true,
                    fillColor: enabled
                        ? DSCoreColors.transparent
                        : DSCoreColors.neutral01,
                    contentPadding: contentPadding ??
                        const EdgeInsets.symmetric(
                          vertical: 14.0,
                          horizontal: 16.0,
                        ),
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon,
                    border: OutlineInputBorder(
                      borderRadius: borderRadius ??
                          BorderRadius.circular(DSRadius.radiusMd),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: borderRadius ??
                          BorderRadius.circular(DSRadius.radiusMd),
                      borderSide: const BorderSide(
                        color: DSCoreColors.neutral08,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: borderRadius ??
                          BorderRadius.circular(DSRadius.radiusMd),
                      borderSide: const BorderSide(
                        color: DSCoreColors.red,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: borderRadius ??
                          BorderRadius.circular(DSRadius.radiusMd),
                      borderSide: const BorderSide(
                        color: DSCoreColors.red,
                      ),
                    ),
                    // helperText: isRequired ? 'Trường bắt buộc' : null,
                    // helperStyle: BaseTextStyle.captionSmall.applyColor(
                    //   BaseColors.textSubtitle,
                    // ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: borderRadius ??
                          BorderRadius.circular(DSRadius.radiusMd),
                      borderSide: const BorderSide(
                        color: DSCoreColors.neutral02,
                      ),
                      // isRequired
                      //     ? const BorderSide(
                      //         color: CoreColors.red,
                      //       )
                      //     :
                      // BorderSide.none,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: borderRadius ??
                          BorderRadius.circular(DSRadius.radiusMd),
                      borderSide: const BorderSide(
                        color: DSCoreColors.neutral02,
                      ),
                    ),
                  ),
              textInputAction: TextInputAction.done,
              onSubmitted: (value) {
                FocusScope.of(context).unfocus();
              },
              keyboardType: textInputType ?? TextInputType.text,
              inputFormatters: inputFormatters,
              style: DSTextStyle.bodySmall.applyColor(DSCoreColors.neutral08),
            ),
          ),
        ),
      ],
    );
  }
}
