class Profile {
  String name;
  int age;
  String gender;
  int height;
  int weight;
  double bmi;
  String activityLevel;
  List<String> allergies;

  Profile({
    required this.name,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.bmi,
    required this.activityLevel,
    required this.allergies,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      height: json['height'],
      weight: json['weight'],
      bmi: json['bmi'],
      activityLevel: json['activityLevel'],
      allergies: List<String>.from(json['allergies']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'gender': gender,
      'height': height,
      'weight': weight,
      'bmi': bmi,
      'activityLevel': activityLevel,
      'allergies': allergies,
    };
  }
}