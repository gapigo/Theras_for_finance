import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'views/menu_empresas/main.dart';
import 'views/details_screen/main.dart';
import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
    'adViewType',
    (int viewId) => IFrameElement()
      ..width = '320'
      ..height = '100'
      ..src = 'ad.html'
      ..style.border = 'none',
  );
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
    'adViewType1',
    (int viewId) => IFrameElement()
      ..width = '320'
      ..height = '100'
      ..src = 'ad copy.html'
      ..style.border = 'none',
  );
  runApp(const MyApp());
}
Widget adsenseAdsView() {
  return SizedBox(
    height: 300.0,
    width: 280.0,
    child: HtmlElementView(
      viewType: 'adViewType',
    ),
  );
}
Widget adsenseAdsView1() {
  return SizedBox(
    height: 300.0,
    width: 280.0,
    child: HtmlElementView(
      viewType: 'adViewType1',
    ),
  );
}class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theras for Finance',
      home: FutureBuilder(builder: (context, snapshot) {
        return const MenuEmpresas(title: 'T H Ξ R A S');
      }),
    );
  }
}
