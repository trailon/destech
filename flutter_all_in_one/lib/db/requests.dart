import 'dart:convert';

import 'package:flutter_all_in_one/db/uris.dart';
import 'package:flutter_all_in_one/models/booklistmodel.dart';
import 'package:http/http.dart' as http;

class Requests {
  static Future getBookList() async {
    var request = http.Request(
        'GET',
        Uri.parse(Uris.books +
            UriParameter.quantity(100) +
            UriParameter.locale("en_US")));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responsebody = await response.stream.bytesToString();
      var decodedJson = jsonDecode(responsebody);
      return BookList.fromJson(decodedJson);
    } else {
      throw Exception('Failed to load book list');
    }
  }
}
