import 'package:flutter/material.dart';
import 'package:password_field_validator/src/requirement_widget.dart';

class PasswordFieldValidator extends StatefulWidget {
  /// Password `validation` is given at the bottom which can be `modified` accordingly.
  /// Full package can be modified easily

  /// Input decoration of Text field by default it is OutlineInputBorder
  //final InputDecoration? inputDecoration;

  /// controller for the field
  final TextEditingController controller;

  /// textInputAction for the field. By default its set to [done]
  final TextInputAction? textInputAction;

  /// onEditComplete callBack for the field
  final void Function()? onEditComplete;

  /// onFieldSubmitted callBack for the field
  final String Function(String)? onFieldSubmitted;

  /// focusNode for the field
  final FocusNode? focusNode;

  /// cursorColor
  final Color? cursorColor;
  final ValueChanged<String>? onChanged;

  /// textStyle of the Text in field
  final TextStyle? textStyle;

  /// Password requirements attributes
  /// iconData for the icons when requirement is completed
  final IconData? activeIcon;

  /// iconData for the icons when the requirement is incomplete/inActive
  final IconData? inActiveIcon;

  /// color of the text when requirement is completed
  final Color? activeRequirementColor;

  /// color of the text when the requirement is not completed/inActive
  final Color? inActiveRequirementColor;

  /// Constructor
  const PasswordFieldValidator({
    super.key,

    /// [default inputDecoration]
/*     this.inputDecoration = const InputDecoration(
      border: OutlineInputBorder(),
      labelText: "Password",
    ), */
    required this.controller,

    /// [default textInputAction]
    this.textInputAction = TextInputAction.done,
    this.onEditComplete,
    this.onFieldSubmitted,
    this.focusNode,
    this.cursorColor,
    this.textStyle,

    /// Password requirements initialization
    /// [default inActiveIcon]
    this.inActiveIcon = Icons.check_circle_outline_rounded,

    /// [default activeIcon]
    this.activeIcon = Icons.check_circle_rounded,

    /// [default inActive Color]
    this.inActiveRequirementColor = Colors.grey,

    /// [default active color]
    this.activeRequirementColor = Colors.blueAccent,
    this.onChanged,
    //this.inputDecoration,
  });

  @override
  _PasswordFieldValidatorState createState() => _PasswordFieldValidatorState();
}

class _PasswordFieldValidatorState extends State<PasswordFieldValidator> {
  String _pass = "";
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    _pass = widget.controller!.text;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        /// [Password TextFormField]
        /// Use `Form` to validate the field easily
        TextFormField(
          textInputAction: widget.textInputAction,
          controller: widget.controller,
          keyboardType: TextInputType.text,
          obscureText: _hidePassword,
          /* decoration: widget.inputDecoration, */
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: "Password",
            suffixIcon: IconButton(
              icon: Icon(
                color: Colors.grey,
                _hidePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              ),
              onPressed: () {
                setState(
                  () {
                    _hidePassword = !_hidePassword;
                  },
                );
              },
            ),
          ),
          onEditingComplete: widget.onEditComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          focusNode: widget.focusNode,
          cursorColor: widget.cursorColor,
          style: widget.textStyle,
          onChanged: (value) {
            setState(() {
              _pass = value;
            });
            widget.onChanged?.call(value);
          },
          validator: passwordValidation,
        ),
        const SizedBox(height: 10.0),

        Column(
          children: [
            PassCheckRequirements(
              passCheck: _pass.contains(RegExp(r'[A-Z]')),
              requirementText: "1 Uppercase [A-Z]",
              activeColor: widget.activeRequirementColor,
              inActiveColor: widget.inActiveRequirementColor,
              inActiveIcon: widget.inActiveIcon,
              activeIcon: widget.activeIcon,
            ),
            PassCheckRequirements(
              passCheck: _pass.contains(RegExp(r'[0-9]')),
              requirementText: "1 numeric value [0-9]",
              activeColor: widget.activeRequirementColor,
              inActiveColor: widget.inActiveRequirementColor,
              inActiveIcon: widget.inActiveIcon,
              activeIcon: widget.activeIcon,
            ),
            PassCheckRequirements(
              passCheck: _pass.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
              requirementText: "1 special character [#, \$, % etc..]",
              activeColor: widget.activeRequirementColor,
              inActiveColor: widget.inActiveRequirementColor,
              inActiveIcon: widget.inActiveIcon,
              activeIcon: widget.activeIcon,
            ),
            PassCheckRequirements(
              passCheck: _pass.length >= 6,
              requirementText: "6 characters minimum",
              activeColor: widget.activeRequirementColor,
              inActiveColor: widget.inActiveRequirementColor,
              inActiveIcon: widget.inActiveIcon,
              activeIcon: widget.activeIcon,
            ),
          ],
        ),
      ],
    );
  }

  /// [password validation]
  /// 1 Uppercase
  /// 1 lowercase
  /// 1 numeric value
  /// 1 special character
  /// 6 length password

  /// In case you want to `modify` the requirements change the `RegExp` given below
  String? passwordValidation(String? value) {
    bool passValid =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')

            /// [RegExp]
            .hasMatch(value!);
    if (value.isEmpty) {
      return "Password cannot be emtpy!";
    } else if (!passValid) {
      return "Requirement(s) missing!";
    }
    return null;
  }
}
