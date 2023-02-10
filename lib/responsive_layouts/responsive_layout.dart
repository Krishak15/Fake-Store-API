import 'package:flutter/cupertino.dart';

class RespLayouts extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabScaffold;
  final Widget desktopScaffold;

  const RespLayouts(
      {super.key,
      required this.mobileScaffold,
      required this.tabScaffold,
      required this.desktopScaffold});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        if (constrains.maxWidth < 500) {
          return mobileScaffold;
        } else if (constrains.maxWidth < 1100) {
          return tabScaffold;
        } else {
          return desktopScaffold;
        }
      },
    );
  }
}
