import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String toast) {
    Fluttertoast.showToast(
                              msg: toast,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.black87,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
}