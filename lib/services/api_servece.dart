import 'dart:convert';

import 'package:booksapp/models/requestmodel.dart';
import 'package:booksapp/models/responcemodel.dart';
import 'package:http/http.dart' as http;

import '../../config.dart';

import 'shared_service.dart';

class APIService {
  static var client = http.Client();
  static const int maxRedirects = 5;
  static const int maxRedirectssignin = 5;

  static Future<bool> getleads(RequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.getlead,
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    int redirectCount = 0;

    while (response.statusCode == 301 || response.statusCode == 307) {
      // Check if the maximum number of redirects has been reached
      if (redirectCount >= maxRedirects) {
        throw Exception('Exceeded maximum number of redirections');
      }

      // Get the redirect URL from the Location header
      var redirectUrl = response.headers['location'];
      if (redirectUrl == null || redirectUrl.isEmpty) {
        throw Exception('Redirect URL is missing or empty');
      }
      var redirectUri = Uri.parse(redirectUrl);

      // Send a request to the redirect URL
      response = await client.post(
        redirectUri,
        headers: requestHeaders,
        body: jsonEncode(model.toJson()),
      );

      redirectCount++;
    }

    if (response.statusCode == 200) {
      await SharedService.setLeadsDetails(
        responseJson(
          response.body,
        ),
      );
      return true;
    } else {
      return false;
    }
  }
}
