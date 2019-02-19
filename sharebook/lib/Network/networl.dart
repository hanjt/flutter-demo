import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Model/detailResponse.dart';
import 'api.dart';

Future<DetailResponse> fetchBookDetail(String isbn) async {
  var url = API.host+API.detail+isbn;
  print('url is $url');
  final response =
      await http.get('$url');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return DetailResponse.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}