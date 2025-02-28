part of '../../../ds.dart';

class DsRadio extends StatelessWidget {
  // final bool isSelected;
  // final bool isCheckSelected;
  // final bool isDisabled;
  // final String? text;

  final bool selected;
  final bool disabled;
  final bool checkSelected;
  final String? text;
  final VoidCallback? onTap;

  // const DsRadio({
  //   required this.isSelected,
  //   super.key,
  //   this.isCheckSelected = false,
  //   this.isDisabled = false,
  //   this.text,
  // });

  // @override
  // Widget build(BuildContext context) {
  //   Color activeColor = DSColors.primary;
  //   Color disabledColor = DSColors.primary.withValues(alpha: 0.4);
  //
  //   Widget radioIcon;
  //   if (isCheckSelected) {
  //     radioIcon = Icon(Icons.check_circle, color: isDisabled ? disabledColor : activeColor);
  //   } else {
  //     radioIcon = Icon(
  //       isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
  //       color: isDisabled ? disabledColor : activeColor,
  //     );
  //   }
  //
  //   return Row(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       radioIcon,
  //       if (text != null) ...[
  //         const Gap(DSSpacing.spacing2),
  //         Text(
  //           text!,
  //           style: TextStyle(
  //             color: isDisabled ? Colors.grey : Colors.black,
  //           ),
  //         ),
  //       ]
  //     ],
  //   );
  // }

  const DsRadio({
    super.key,
    required this.selected,
    this.checkSelected = false,
    this.disabled = false,
    this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Widget radioIcon;
    // if (disabled) {
    //   if (checkSelected) {
    //     radioIcon = Icon(Icons.radio_button_checked, color: Colors.red.shade200);
    //   } else if (selected) {
    //     radioIcon = Icon(Icons.radio_button_on, color: Colors.red.shade200);
    //   } else {
    //     radioIcon = Icon(Icons.radio_button_off, color: Colors.grey.shade300);
    //   }
    // } else {
    //   if (checkSelected) {
    //     radioIcon = Icon(Icons.check_circle, color: Colors.red);
    //   } else if (selected) {
    //     radioIcon = Icon(Icons.radio_button_on, color: Colors.red);
    //   } else {
    //     radioIcon = Icon(Icons.radio_button_off, color: Colors.grey);
    //   }
    // }

    Widget radioIcon;
    if (disabled) {
      if (checkSelected) {
        radioIcon = Icon(Icons.check_circle, color: DSColors.primary.withValues(alpha: 0.5)); // ✅ (check, màu nhạt)
      } else if (selected) {
        radioIcon = Icon(Icons.radio_button_on, color: DSColors.primary.withValues(alpha: 0.5)); // 🔘 (radio, màu nhạt)
      } else {
        radioIcon = Icon(Icons.radio_button_off, color: DSColors.secondary.withValues(alpha: 0.5)); // ⚪ (off, màu xám)
      }
    } else {
      if (checkSelected) {
        radioIcon = Icon(Icons.check_circle, color: DSColors.primary); // ✅ (check, màu đỏ đậm)
      } else if (selected) {
        radioIcon = Icon(Icons.radio_button_on, color: DSColors.primary); // 🔘 (radio, màu đỏ đậm)
      } else {
        radioIcon = Icon(Icons.radio_button_off, color:DSColors.secondary); // ⚪ (off, màu xám)
      }
    }

    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: Row(
        children: [
          radioIcon,
          if (text != null) ...[
            const SizedBox(width: 8),
            Text(
              text!,
              style: DSTextStyle.bodyMedium.applyColor(disabled ? DSColors.textDisable : DSColors.textBody),
              // style: TextStyle(color: disabled ? Colors.grey.shade400 : Colors.black),
            ),
          ]
        ],
      ),
    );
  }
}
