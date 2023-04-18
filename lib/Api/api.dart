import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class Api {
  Future getMethod(String url, String accesstoken) async {
    var response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $accesstoken'},
    );
    var resbody = convert.jsonDecode(response.body);
    return resbody;
  }

  Future postMethod(String url, dynamic data, String accesstoken) async {
    var response = await http.post(Uri.parse(url),
        headers: {'Authorization': 'Bearer $accesstoken'}, body: data);
    var resbody = convert.jsonDecode(response.body);
    return resbody;
  }

  Future fetchToken(String url) async {
    var response = await http.post(Uri.parse(url), body: {
      "grant_type": "client_credentials",
      "client_id": "3",
      "client_secret": "l3tVa2X1NIYF6M13MvEP1hx4pHqGUOcsqDOoQbLH"
    });
    if (response.statusCode == 200) {
      var resbody = convert.jsonDecode(response.body);
      return resbody;
    }
  }
}
