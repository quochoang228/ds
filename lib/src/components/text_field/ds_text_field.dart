part of '../../../ds.dart';

typedef ValidatorTextField<T> = String? Function(T? value);

/// Primary text form field
class DSTextField extends StatefulWidget {
  const DSTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.textStyle,
    this.labelSuffix,
    this.helpText,
    this.helpTextStyle,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.inputFormatters = const [],
    this.autofocus = false,
    this.showErrorOnFocus = true,
    this.obscureText = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.height = 56,
    this.isRequired = false,
    this.enabled = true,
    this.clear = true,
    this.readOnly = false,
    this.onClear,
    this.alignment = Alignment.center,
    this.onChanged,
    this.onTap,
    this.scrollPadding,
    this.contextMenuBuilder,
    this.autoValidateMode,
    this.onFieldSubmitted,
    this.prefix,
    this.suffix,
    this.maxLength,
    this.focusNode,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.showCounterText = false,
    this.borderRadius,
  });

  /// text form field are
  const DSTextField.area({
    super.key,
    required this.controller,
    this.textStyle,
    this.labelText,
    this.labelSuffix,
    this.helpText,
    this.helpTextStyle,
    this.hintText,
    this.keyboardType = TextInputType.multiline,
    this.textInputAction = TextInputAction.newline,
    this.inputFormatters = const [],
    this.autofocus = false,
    this.showErrorOnFocus = true,
    this.obscureText = false,
    this.minLines,
    this.maxLines,
    this.height,
    this.isRequired = false,
    this.enabled = true,
    this.clear = true,
    this.readOnly = false,
    this.onClear,
    this.alignment = const Alignment(0, 0),
    this.onChanged,
    this.onTap,
    this.scrollPadding,
    this.contextMenuBuilder,
    this.autoValidateMode,
    this.onFieldSubmitted,
    this.prefix,
    this.suffix,
    this.maxLength,
    this.focusNode,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.showCounterText = false,
    this.borderRadius,
  });

  /// if controller is null, a private widget controller will be used instead
  final TextEditingController controller;

  /// label text
  final String? labelText;

  /// Label suffix
  final Widget? labelSuffix;

  /// hint text
  final String? hintText;

  /// hint text
  final String? helpText;

  final TextStyle? helpTextStyle;

  /// keyboard input type
  final TextInputType keyboardType;

  final AutovalidateMode? autoValidateMode;

  final ValueChanged? onFieldSubmitted;

  final FocusNode? focusNode;

  final TextCapitalization textCapitalization;

  /// auto focus
  final bool autofocus;

  final TextStyle? textStyle;

  /// An action the user has requested the text input control to perform.
  final TextInputAction textInputAction;

  /// Text input formatters
  final List<TextInputFormatter> inputFormatters;

  /// Text input validator
  final String? Function(String)? validator;

  /// show error on focus or not
  final bool showErrorOnFocus;

  /// obscureText
  final bool obscureText;

  /// Text min line
  final int? minLines;

  /// Text max line
  final int? maxLines;

  /// Height text field
  final double? height;

  /// Is TextFormField required
  final bool isRequired;

  /// Is enabled
  final bool enabled;

  /// Read only mode
  final bool readOnly;

  /// Has clear button or not
  final bool clear;

  /// onClear callback
  final VoidCallback? onClear;

  /// Prefix
  final Widget? prefix;

  /// Suffix
  final Widget? suffix;

  /// AlignmentGeometry
  final AlignmentGeometry? alignment;

  /// Scroll padding
  final EdgeInsets? scrollPadding;

  /// On text change
  final ValueChanged<String>? onChanged;

  /// On tap text field
  final VoidCallback? onTap;

  /// EditableTextContextMenuBuilder
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  final int? maxLength;

  final bool showCounterText;

  final BorderRadiusGeometry? borderRadius;

  @override
  State<DSTextField> createState() => _DSTextFieldState();
}

class _DSTextFieldState extends State<DSTextField> {
  late TextEditingController _controller;

  bool _hasError = false;
  String? _errorString;
  bool _hasText = false;
  bool _hasFocus = false;

  TextStyle _textFieldStyle() {
    return DSTextStyle.bodyMedium.copyWith(
      color: widget.enabled ? DSColors.textBody : DSColors.textDisable,
    );
  }

  TextStyle _errorTextStyle() {
    return DSTextStyle.captionLarge.copyWith(
      color: DSColors.error,
    );
  }

  Color _borderColor({
    required bool enabled,
    required bool hasFocus,
    required bool hasError,
  }) {
    return enabled
        ? hasError
            ? DSColors.error
            : hasFocus
                ? DSColors.borderFocus
                : DSColors.borderDefault
        : DSColors.borderDefault;
  }

  void _listener() {
    setState(() {
      _hasText = _controller.text.isNotEmpty;
      _errorString = widget.validator?.call(_controller.text);
      _hasError = _errorString?.isNotEmpty ?? false;
    });
  }

  @override
  void initState() {
    _controller = widget.controller;
    _hasText = _controller.text.isNotEmpty;
    _controller.addListener(_listener);

    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: widget.height,
            alignment: widget.alignment,
            padding: EdgeInsets.symmetric(
              horizontal: widget.prefix != null ? 16 : 8,
            ),
            decoration: BoxDecoration(
              color: _backgroundColor(
                enabled: widget.enabled,
                hasError: _hasError,
              ),
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              border: Border.all(
                color: _borderColor(
                  enabled: widget.enabled,
                  hasFocus: _hasFocus,
                  hasError: _hasError,
                ),
              ),
            ),
            child: Row(
              children: [
                if (widget.prefix != null) ...[
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: widget.prefix!,
                  ),
                ],
                Expanded(
                  child: widget.onTap != null
                      ? IgnorePointer(
                          child: _textFormField(),
                        )
                      : _textFormField(),
                ),
                if (_hasFocus && widget.clear && _hasText && !widget.readOnly && widget.enabled) ...[
                  _buildClearTextButton(),
                ],
                if (widget.suffix != null) ...[
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: widget.suffix!,
                  ),
                ],
              ],
            ),
          ),
          if (_hasError) ...[
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 4,
              ),
              child: Text(
                _errorString ?? '',
                style: _errorTextStyle(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildClearTextButton() {
    return Padding(
      padding: EdgeInsets.only(
        right: widget.suffix == null ? 0 : 8,
      ),
      child: InkWell(
        onTap: () {
          _controller.clear();
          setState(() {
            _hasText = false;
          });
          widget.onClear?.call();
        },
        child: SvgPicture.asset(
          DSAssets.cancel,
          package: DSStrings.flutterPackageName,
        ),
      ),
    );
  }

  Widget _textFormField() {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) {
          setState(() => _hasFocus = focus);
        },
        child: TextFormField(
          onChanged: (value) {
            widget.onChanged?.call(value);
          },
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          controller: _controller,
          style: widget.textStyle ?? _textFieldStyle(),
          autofocus: widget.autofocus,
          obscureText: widget.obscureText,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.inputFormatters,
          autovalidateMode: widget.autoValidateMode,
          textCapitalization: widget.textCapitalization,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          contextMenuBuilder: widget.contextMenuBuilder,
          onFieldSubmitted: widget.onFieldSubmitted,
          scrollPadding: widget.scrollPadding ?? const EdgeInsets.only(bottom: 116),
          validator: (value) {
            final errorString = widget.validator?.call(_controller.text);
            // setState(() {
            _errorString = errorString;
            if (widget.validator?.call(_controller.text)?.isNotEmpty ?? false) {
              _hasError = true;
            } else {
              _hasError = false;
            }
            // });
            return _hasError ? '' : null;
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 8,
            ),
            label: _label(),
            hintText: widget.hintText,
            hintStyle: DSTextStyle.bodyLarge.copyWith(color: DSColors.textPlaceholder),
            counterText: widget.maxLength != null && widget.showCounterText ? widget.maxLength.toString() : '',
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            errorStyle: DSTextStyle.captionLarge.copyWith(color: DSColors.error),
            focusedErrorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            // floatingLabelAlignment: FloatingLabelBehavior.always,
            // helperText: widget.helpText,
            // helperStyle: widget.helpTextStyle ?? DSTextStyle.bodyText13.copyWith(color: DSColors.textBody),
          ),
          ///
          textAlign: TextAlign.start,

        ),
      ),
    );
  }

  Color _backgroundColor({
    required bool enabled,
    required bool hasError,
  }) {
    return enabled
        ? hasError
            ? DSColors.backgroundWhite
            : DSColors.backgroundWhite
        : DSColors.backgroundGray1;
  }

  Widget? _label() {
    if (widget.labelText == null) {
      return null;
    }

    if (widget.labelSuffix != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Label(
            labelText: widget.labelText!,
            enabled: widget.enabled,
            hasFocus: _hasFocus,
            hasError: _hasError,
            hasText: _controller.text.isNotEmpty,
            required: widget.isRequired,
          ),
          if (_controller.text.isNotEmpty) ...[
            const SizedBox(width: 12),
            widget.labelSuffix!,
          ],
        ],
      );
    }

    return _Label(
      labelText: widget.labelText!,
      enabled: widget.enabled,
      hasFocus: _hasFocus,
      hasError: _hasError,
      hasText: _controller.text.isNotEmpty,
      required: widget.isRequired,
    );
  }
}

class _Label extends StatelessWidget {
  const _Label({
    required this.labelText,
    required this.enabled,
    required this.hasFocus,
    required this.hasError,
    required this.hasText,
    this.required = false,
  });

  final String labelText;

  final bool enabled;
  final bool hasFocus;
  final bool hasError;
  final bool hasText;

  final bool required;

  TextStyle _labelTextStyle({
    required bool hasText,
    required bool hasFocus,
    required bool hasError,
    required bool enabled,
  }) {
    return hasFocus
        ? DSTextStyle.captionMedium.copyWith(
            color: !hasError ? DSColors.textSubtitle : DSColors.error,
          )
        : hasText
            ? DSTextStyle.captionMedium.copyWith(
                color: enabled
                    ? !hasError
                        ? DSColors.textSubtitle
                        : DSColors.error
                    : DSColors.textDisable,
              )
            : DSTextStyle.bodyMedium.copyWith(color: DSColors.textBody);
  }

  @override
  Widget build(BuildContext context) {
    final labelTextStyle = _labelTextStyle(
      hasText: hasText,
      hasFocus: hasFocus,
      hasError: hasError,
      enabled: enabled,
    );

    final requiredTextStyle = labelTextStyle.copyWith(
      color: DSColors.required,
    );

    return Text.rich(
      TextSpan(
        style: labelTextStyle,
        children: <TextSpan>[
          TextSpan(text: labelText),
          if (required) ...[
            TextSpan(
              text: ' *',
              style: requiredTextStyle,
            ),
          ],
        ],
      ),
    );
    // return RichText(
    //   text: TextSpan(
    //     style: labelTextStyle,
    //     children: <TextSpan>[
    //       TextSpan(text: labelText),
    //       if (required) ...[
    //         TextSpan(
    //           text: ' *',
    //           style: requiredTextStyle,
    //         ),
    //       ],
    //     ],
    //   ),
    // );
  }
}
