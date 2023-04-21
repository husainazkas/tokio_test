import 'package:flutter/material.dart';

class HideFocus extends StatelessWidget {
  const HideFocus({super.key, this.child});

  final Widget? child;

  void unfocus(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocus(context),
      child: child,
    );
  }
}
