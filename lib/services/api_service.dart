import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:nutrifact/constants/api_consts.dart';
import 'package:nutrifact/models/models_model.dart';
import 'package:mime/mime.dart';

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
  static Future<void> sendMessage({
    required String message,
    required String modelId,
    required List<File> imagesList,
  }) async {
    try {
      // Convert images to base64
      String combinedMessage = message;
      for (var image in imagesList) {
        String mimeType = lookupMimeType(image.path) ?? 'application/octet-stream';
        String base64Image = base64Encode(image.readAsBytesSync());
        combinedMessage += '\nImage: data:$mimeType;base64,$base64Image';
      }

      // Prepare the payload
      var payload = {
        'model': modelId,
        'messages': [
          {'role': 'user', 'content': combinedMessage}
        ],
        'max_tokens': 1000,
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

      if (jsonResponse['choices'] != null && jsonResponse['choices'].length > 0) {
        print("Response: ${jsonResponse['choices'][0]['message']['content']}");
      }
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }
}