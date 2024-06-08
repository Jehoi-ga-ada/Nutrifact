import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:nutrifact/models/profile_model.dart';

class ProfileStorage {
  Future<String> _getLocalPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _getLocalFile() async {
    final path = await _getLocalPath();
    return File('$path/profile.json');
  }

  Future<Profile> readProfile() async {
    try {
      final file = await _getLocalFile();
      String contents = await file.readAsString();
      Map<String, dynamic> json = jsonDecode(contents);
      return Profile.fromJson(json);
    } catch (e) {
      // If encountering an error, return a default profile
      return Profile(
        name: 'Guest',
        age: 0,
        gender: 'Female',
        height: 0,
        weight: 0,
        bmi: 0,
        activityLevel: 'Moderate',
        allergies: ['Dairy', 'Fish', 'Strawberries', 'Peanuts'],
      );
    }
  }

  Future<File> writeProfile(Profile profile) async {
    final file = await _getLocalFile();
    return file.writeAsString(jsonEncode(profile.toJson()));
  }
}
