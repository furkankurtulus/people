import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:people/controller/multiLanguage.dart';
import 'package:people/utility/connectionErrorPage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:people/views/home.dart';

void main() async {
  await GetStorage.init();
  runApp(People());
}

class People extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dem',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var uName;

  @override
  Widget build(BuildContext context) {
    getConnectData(context);
    GetStorage storage = GetStorage();
    var _uName = storage.read("name");
    storage.write("apiURL", "api.ifair.pro");
    print(storage.read("apiURL"));
    return GetMaterialApp(
      translations: MultiLanguage(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      // home: _uName == null ? Login() : SplashScreen(),
      home: Home(),
      routes: {
        "/home": (context) => Home(),
        // "/customerList": (context) => CustomerList(),
        // "/order": (context) => OrderWidget(),
        // "/mailSender": (context) => HtmlMailSend(),
        // "/printerPage": (context) => PrintPage(),
      },
    );
  }

  Future getConnectData(context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Get.offAll(ConnectionError());
      // error(context);
    } else
      return connectivityResult;
  }
}
