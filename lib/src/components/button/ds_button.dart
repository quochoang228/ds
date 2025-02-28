part of '../../../ds.dart';

enum ButtonSize { s, m, l }

enum ButtonIconPosition { ltr, rtl }

class DSButton extends StatelessWidget {
  final String label;
  final Widget? icon;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final AlignmentGeometry? alignment;
  final TextStyle? textStyle;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final ButtonIconPosition buttonIconPosition;
  final ButtonSize buttonSize;

  final Color backgroundColor;
  final Color backgroundColorPressed;
  final Color backgroundColorDisabled;

  final Color foregroundColor;
  final Color foregroundColorPressed;
  final Color foregroundColorDisabled;

  final BorderSide? borderSide;

  final bool isLoading; // New property to indicate loading state

  const DSButton({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.buttonIconPosition = ButtonIconPosition.ltr,
    this.buttonSize = ButtonSize.m,
    this.style,
    this.alignment,
    this.textStyle,
    this.elevation,
    this.padding,
    this.borderRadius,
    this.backgroundColor = DSCoreColors.primary,
    this.backgroundColorPressed = DSCoreColors.primary,
    this.backgroundColorDisabled = DSCoreColors.primary02,
    this.foregroundColor = DSCoreColors.white,
    this.foregroundColorPressed = DSCoreColors.white,
    this.foregroundColorDisabled = DSCoreColors.neutral03,
    this.borderSide = BorderSide.none,
    this.isLoading = false, // Initialize the new property
  });

  const DSButton.ghost({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.buttonIconPosition = ButtonIconPosition.ltr,
    this.buttonSize = ButtonSize.m,
    this.style,
    this.alignment,
    this.textStyle,
    this.elevation,
    this.padding,
    this.borderRadius,
    this.backgroundColor = Colors.transparent,
    this.backgroundColorPressed = Colors.transparent,
    this.backgroundColorDisabled = DSCoreColors.neutral01,
    this.foregroundColor = DSCoreColors.neutral03,
    this.foregroundColorPressed = DSCoreColors.neutral03,
    this.foregroundColorDisabled = DSCoreColors.neutral05,
    this.borderSide,
    this.isLoading = false, // Initialize the new property
  });

  const DSButton.icon({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.buttonIconPosition = ButtonIconPosition.ltr,
    this.buttonSize = ButtonSize.m,
    this.style,
    this.alignment,
    this.textStyle,
    this.elevation,
    this.padding,
    this.borderRadius,
    this.backgroundColor = Colors.transparent,
    this.backgroundColorPressed = Colors.transparent,
    this.backgroundColorDisabled = DSCoreColors.neutral01,
    this.foregroundColor = DSCoreColors.neutral03,
    this.foregroundColorPressed = DSCoreColors.neutral03,
    this.foregroundColorDisabled = DSCoreColors.neutral05,
    this.borderSide = BorderSide.none,
    this.isLoading = false,
  });

  // const JobbyButton.secondary({
  //   super.key,
  //   required this.label,
  //   this.icon,
  //   this.onPressed,
  //   this.buttonIconPosition = ButtonIconPosition.ltr,
  //   this.style,
  //   this.alignment,
  //   this.textStyle,
  //   this.elevation,
  //   this.padding,
  //   this.borderRadius,
  //   this.backgroundColor = CoreColors.neutral01,
  //   this.backgroundColorPressed = CoreColors.neutral04,
  //   this.backgroundColorDisabled = CoreColors.neutral01,
  //   this.foregroundColor = CoreColors.neutral09,
  //   this.foregroundColorPressed = CoreColors.neutral09,
  //   this.foregroundColorDisabled = CoreColors.neutral03,
  //   this.isLoading = false, // Initialize the new property
  // });

  double getHeight() {
    switch (buttonSize) {
      case ButtonSize.s:
        return 32.0;
      case ButtonSize.m:
        return 40.0;
      case ButtonSize.l:
        return 48.0;
    }
  }

  double getWidth() {
    switch (buttonSize) {
      case ButtonSize.s:
        return 200.0;
      case ButtonSize.m:
        return 280.0;
      case ButtonSize.l:
        return 343.0;
    }
  }

  // EdgeInsets getPadding() {
  //   switch (buttonSize) {
  //     case ButtonSize.s:
  //       return const EdgeInsets.symmetric(horizontal: 16);
  //     case ButtonSize.m:
  //       return const EdgeInsets.symmetric(horizontal: 24);
  //     case ButtonSize.l:
  //       return const EdgeInsets.symmetric(horizontal: 32);
  //   }
  // }

  TextStyle getTextStyle() {
    switch (buttonSize) {
      case ButtonSize.s:
        return DSTextStyleFS.fsButtonS;
      case ButtonSize.m:
        return DSTextStyleFS.fsButtonM;
      case ButtonSize.l:
        return DSTextStyleFS.fsButtonL;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: getHeight(),
      // width: getWidth(),
      child: ElevatedButton(
        key: key,
        onPressed: isLoading ? null : onPressed, // Disable button when loading
        style: style ??
            ButtonStyle(
              alignment: alignment ?? Alignment.center,
              elevation: WidgetStatePropertyAll(elevation ?? 0.0),
              textStyle: WidgetStatePropertyAll(
                textStyle ?? getTextStyle(),
              ),
              backgroundColor: WidgetStateProperty.resolveWith(
                (states) {
                  if (states.contains(WidgetState.disabled)) {
                    return backgroundColorDisabled;
                  } else if (states.contains(WidgetState.pressed)) {
                    return backgroundColorPressed;
                  } else {
                    return backgroundColor;
                  }
                },
              ),
              foregroundColor: WidgetStateProperty.resolveWith(
                (states) {
                  if (states.contains(WidgetState.disabled)) {
                    return foregroundColorDisabled;
                  } else if (states.contains(WidgetState.pressed)) {
                    return foregroundColorPressed;
                  } else {
                    return foregroundColor;
                  }
                },
              ),
              padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
                padding ??
                    const EdgeInsets.symmetric(
                      vertical: DSSpacing.spacing4,
                    ),
              ),
              shape: WidgetStatePropertyAll<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(DSRadius.radiusLd),
                ),
              ),
              // fixedSize: const WidgetStatePropertyAll<Size?>(
              //   Size(66, 24),
              // ),
              // side: WidgetStatePropertyAll<BorderSide>(
              //   borderSide ??
              //       const BorderSide(
              //         color: JobbyColors.gray900,
              //         width: 1,
              //         style: BorderStyle.solid,
              //       ),
              // ),
              side: WidgetStateProperty.resolveWith(
                (states) {
                  return borderSide ??
                      BorderSide(
                        color: states.contains(WidgetState.disabled) ? DSCoreColors.neutral03 : DSCoreColors.neutral09,
                        width: 1,
                        style: BorderStyle.solid,
                      );
                  // if (states.contains(WidgetState.disabled)) {
                  //   return foregroundColorDisabled;
                  // } else if (states.contains(WidgetState.pressed)) {
                  //   return foregroundColorPressed;
                  // } else {
                  //   return foregroundColor;
                  // }
                },
              ),
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            icon != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: buttonIconPosition == ButtonIconPosition.ltr ? TextDirection.ltr : TextDirection.rtl,
                    children: [
                      icon!,
                      const SizedBox(
                        width: DSSpacing.spacing2,
                      ),
                      Text(
                        label,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                : Text(
                    label,
                    textAlign: TextAlign.center,
                  ),
            const Gap(DSSpacing.spacing2),
            Visibility(
              visible: isLoading,
              child: CupertinoActivityIndicator(
                color: foregroundColorDisabled,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
