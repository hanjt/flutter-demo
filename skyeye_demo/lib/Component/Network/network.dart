import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'url.dart';
import 'daily.dart';
Future<Daily> fetchPost() async {
  final response = await http.get(
    UrlHost+DailyList,
  );
  final responseJson = json.decode(response.body);

  return Daily.fromJson(responseJson);
}