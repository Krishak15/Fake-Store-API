import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class respLayouts extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabScaffold;
  final Widget DesktopScaffold;

  respLayouts(
      {required this.mobileScaffold,
      required this.tabScaffold,
      required this.DesktopScaffold});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        if (constrains.maxWidth < 500) {
          return mobileScaffold;
        } else if (constrains.maxWidth < 1100) {
          return tabScaffold;
        } else {
          return DesktopScaffold;
        }
      },
    );
  }
}
