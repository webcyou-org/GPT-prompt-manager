import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'const.dart';

dynamic callOpenAPI(String message, String token) async {
  var url = Uri.parse(chatGPTEndpoint);

  var response = await http.post(url,
      body: jsonEncode(
          {"model": chatGPTModel, "prompt": message, "max_tokens": 200}),
      headers: {
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      });
  return utf8.decode(response.bodyBytes);
}
