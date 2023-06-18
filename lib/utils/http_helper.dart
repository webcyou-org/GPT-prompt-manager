import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'const.dart';

void callOpenAPI(String message, String token) async {
  var url = Uri.parse(chatGPTEndpoint);

  print(message);
  var response = await http.post(url,
      body: jsonEncode(
          {"model": chatGPTModel, "prompt": message, "max_tokens": 200}),
      headers: {
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      });
  print(utf8.decode(response.bodyBytes));
}
