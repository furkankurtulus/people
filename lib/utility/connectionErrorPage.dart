import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConnectionError extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ConnectionErrorState();
  }
}

class ConnectionErrorState extends State<ConnectionError> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "noInternetConnection".tr,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.grey[800]),
      body: connectionErrorArea(),
    );
  }

  Widget connectionErrorArea() {
    Future.delayed(Duration(seconds: 3), () {
      SystemNavigator.pop();
    });
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_off,
              color: Colors.red,
              size: 150,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 25),
            Text(
              "noInternetConnection".tr,
              style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Text(
                  "noConnectionDesctiption".tr,
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }
}
