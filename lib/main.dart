import 'package:fake_store/responsive_layouts/desktop_scaffold.dart';
import 'package:fake_store/responsive_layouts/mobile/itemdetails_mobile.dart';
import 'package:fake_store/responsive_layouts/mobile/mobile_scaffold.dart';

import 'package:fake_store/responsive_layouts/responsive_layout.dart';
import 'package:fake_store/responsive_layouts/tablet_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fake Store API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: respLayouts(
          mobileScaffold: MobileScaffol(),
          tabScaffold: const TabletScaffold(),
          DesktopScaffold: const DesktopScaffold()),
    );
  }
}
