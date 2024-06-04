import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:nutrifact/constants/api_consts.dart';
import 'package:nutrifact/models/models_model.dart';

class ApiService{
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("$BASE_URL/models"),
        headers: {'Authorization': 'Bearer $OPENAI_API_KEY'},
      );

      Map jsonResponse = jsonDecode(response.body);

      if(jsonResponse['error'] != null){
        throw HttpException(jsonResponse['error']["message"]);
      }

      List temp = [];
      for (var i in jsonResponse['data']){
        temp.add(i);
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch (e) {
      log("error $e");
      rethrow;
    }
  }
  // send message
  static Future<Map<String, dynamic>> sendMessage({
    required String message,
    required String modelId,
    required List<File> imagesList,
  }) async {
    try {
      // Convert images to base64
      List<String> base64images = [];
      for (var image in imagesList) {
        String base64Image = base64Encode(image.readAsBytesSync());
        base64images.add(base64Image);
      }

      // Prepare the payload
      var payload = {
        'model': modelId,
        'messages': [
          {'role': 'user', 'content': [
            {'type': 'text', 'text':message},
            {
              'type': 'image_url',
              'image_url': {
                'url': 'data:image/jpeg;base64,${base64images[0]}',
              }
            },
            {
              'type': 'image_url',
              'image_url': {
                'url': 'data:image/jpeg;base64,${base64images[1]}',
              }
            }
          ]}
        ],
        'max_tokens': 3000,
      };

      // Make the HTTP POST request
      var response = await http.post(
        Uri.parse("$BASE_URL/chat/completions"),
        headers: {
          'Authorization': 'Bearer $OPENAI_API_KEY',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );

      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']["message"]);
      }

      String content = jsonResponse['choices'][0]['message']['content'];
      content = content.replaceAll(RegExp(r'json'), '');
      content = content.replaceAll(RegExp(r'`'), '');
      if (jsonResponse['choices'] != null && jsonResponse['choices'].length > 0) {
        print("Response: $content");
      }
      Map<String, dynamic> jsonSummary = jsonDecode(content);

      return jsonSummary;

    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }
}