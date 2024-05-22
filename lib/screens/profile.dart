import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
  // final String name;
  // final int age;
  // final String gender;
  // final int height;
  // final int weight;
  // final double bmi;
  // final String activityLevel;
  // final List<String> allergies;
  
  // const ProfileScreen({
  //   super.key,
  //   required this.name,
  //   required this.age,
  //   required this.gender,
  //   required this.height,
  //   required this.weight,
  //   required this.bmi,
  //   required this.activityLevel,
  //   required this.allergies,
  // });
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class InfoCard extends StatelessWidget {
  final String label;
  final String value;
  final String iconPath;

  const InfoCard(
      {super.key,
      required this.label,
      required this.value,
      required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color.fromRGBO(255, 246, 235, 1),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(iconPath, width: 36, height: 36),
        const SizedBox(width: 12),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color.fromRGBO(247, 145, 1, 0.6),
              ),
            ),
            Text(
              value,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Color.fromRGBO(247, 145, 1, 1),
              ),
            ),
          ],
        )
      ]),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String level;

  const ActivityCard({super.key, required this.level});

  Color _getColorForLevel(String level) {
    switch (level) {
      case 'Sedentary':
        return const Color.fromRGBO(
            255, 80, 25, 1); // Change to the desired color for 'Low' level
      case 'Light':
        return const Color.fromRGBO(255, 135, 25,
            1); // Change to the desired color for 'Moderate' level
      case 'Moderate':
        return const Color.fromRGBO(255, 204, 25, 1);
        // Change to the desired color for 'High' level
      default:
        return const Color.fromRGBO(89, 223, 77, 1);
        
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: _getColorForLevel(level),
      ),
      padding: const EdgeInsets.only(right: 21, left: 21, top: 10, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/profile/active.png', width: 55, height: 55),
          const SizedBox(
            height: 17,
            child: Text(
              'Activity Level',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
          SizedBox(
            height: 23,
            child: Text(
              level,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BMIGauge extends StatelessWidget {
  final double bmiValue;

  const BMIGauge({super.key, required this.bmiValue});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsets.only(top: 30, bottom: 0), // Padding inside the border
        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 10,
              maximum: 40,
              startAngle: 180,
              endAngle: 360,
              radiusFactor:
                  3, // Reduce the radius to fit the gauge within a smaller space
              axisLineStyle: const AxisLineStyle(
                cornerStyle: CornerStyle.bothFlat,
                thickness: 10,
                thicknessUnit: GaugeSizeUnit
                    .logicalPixel, // Makes the line thickness consistent
              ),
              ranges: <GaugeRange>[
                GaugeRange(startValue: 10, endValue: 18.5, color: Colors.blue),
                GaugeRange(
                    startValue: 18.5, endValue: 24.9, color: Colors.green),
                GaugeRange(
                    startValue: 24.9, endValue: 29.9, color: Colors.orange),
                GaugeRange(startValue: 29.9, endValue: 40, color: Colors.red),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                    value: bmiValue,
                    needleLength: 0.6,
                    needleStartWidth: 1,
                    needleEndWidth: 2),
              ],
              showLabels: false,
              showTicks: false,
            )
          ],
        ));
  }
}

class BMIIndicator extends StatelessWidget {
  final double bmi;

  const BMIIndicator({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color.fromRGBO(254, 235, 207, 1),
        ),
        padding: const EdgeInsets.only(right: 21, left: 21, top: 15, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 55,
              width: 120,
              child: BMIGauge(bmiValue: bmi),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 17,
                  child: Text(
                    'BMI',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color.fromRGBO(253, 164, 37, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 23,
                  child: Text(
                    bmi.toStringAsFixed(1),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color.fromRGBO(247, 145, 1, 1),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'Maddie';
  int age = 20;
  String gender = 'Female';
  int height = 161;
  int weight = 45;
  double bmi = 17.4;
  String activityLevel = "Moderate";
  List<String> allergies = ['Dairy', 'Fish', 'Strawberries', 'Peanuts'];
  // late String name;
  // late int age;
  // late String gender;
  // late int height;
  // late int weight;
  // late double bmi;
  // late String activityLevel;
  // late List<String> allergies;

  // @override
  // void initState() {
  //   super.initState();
  //   name = widget.name;
  //   age = widget.age;
  //   gender = widget.gender;
  //   height = widget.height;
  //   weight = widget.weight;
  //   bmi = widget.bmi;
  //   activityLevel = widget.activityLevel;
  //   allergies = widget.allergies;
  // }

  // == EDIT POP UP == //
  void _showEditProfileForm(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      backgroundColor: Colors.white,
      context: context,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      isScrollControlled: true,
      barrierColor: Colors.black.withOpacity(0.6),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
            child: ProfileEditForm(
              updateProfile: updateProfile,
            )
        );
      },
    );
  }

  void updateProfile(String name, int age, int height, int weight, String gender, double bmi, String activityLevel, List<String> allergies) {
    setState(() {
      this.name = name;
      this.height = height;
      this.weight = weight;
      this.age = age;
      this.gender = gender;
      this.bmi = bmi;
      this.activityLevel = activityLevel;
      this.allergies = allergies;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // == APP BAR == //
      appBar: AppBar(
        leading: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconButton(
        icon: Image.asset(
          'assets/profile/back.png',
          height: 26,
          width: 26,
        ),
        onPressed: () => Navigator.pop(context),
                  ),
                ),
        title: const Text(
          'Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Mulish',
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: Color.fromRGBO(247, 145, 1, 1),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: GestureDetector(
              onTap: () {
                _showEditProfileForm(context);
              },
              child:
                  Image.asset('assets/profile/edit.png', width: 26, height: 26),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          // == PROFILE PICTURE AND NAME == //
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[200],
              child: Text(name[0],
                  style: const TextStyle(
                      fontSize: 40,
                      color: Color.fromRGBO(187, 191, 194,
                          1))), // Displays the first letter of the name
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: Color.fromRGBO(247, 145, 1, 1),
              ),
            ),

            const SizedBox(height: 4),

            // == AGE, GENDER, WEIGHT, HEIGHT == //
            GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.only(top: 30, left: 32, right: 32),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              crossAxisCount: 2,
              childAspectRatio: (2 / 1),
              children: <Widget>[
                InfoCard(
                  label: 'Age',
                  value: '$age y.o.',
                  iconPath: 'assets/profile/age.png',
                ),
                InfoCard(
                    label: 'Gender',
                    value: gender,
                    iconPath: 'assets/profile/gender.png'),
                InfoCard(
                    label: 'Height',
                    value: '$height cm',
                    iconPath: 'assets/profile/height.png'),
                InfoCard(
                    label: 'Weight',
                    value: '$weight kg',
                    iconPath: 'assets/profile/weight.png'),
              ],
            ),

            // == ACTIVITY LEVEL AND BMI ==//
            GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.only(top: 12, left: 32, right: 32),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              crossAxisCount: 2,
              childAspectRatio: (150 / 120),
              children: <Widget>[
                ActivityCard(level:activityLevel),
                BMIIndicator(bmi: bmi),
              ],
            ),

            // == ALLERGIES == //
            Container(
              padding: const EdgeInsets.only(top: 12, left: 32, right: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 20, right: 20),
                    constraints: const BoxConstraints(minHeight: 140),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(254, 235, 207, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Allergies",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color.fromRGBO(247, 145, 1, 1),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Wrap(
                                spacing: 12.0,
                                // runSpacing: 10.0,
                                children: [
                                  for (String allergen in allergies)
                                    Chip(
                                      label: Text(
                                        allergen,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                          fontFamily: 'Mulish',
                                        ),
                                      ),
                                      backgroundColor:
                                          const Color(0xFFFEA72D),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(17),
                                        side: const BorderSide(
                                            style: BorderStyle.none),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileEditForm extends StatefulWidget {
  final Function updateProfile;

  const ProfileEditForm({super.key, required this.updateProfile});

  @override
  State<ProfileEditForm> createState() => _ProfileEditFormState();
}

class _ProfileEditFormState extends State<ProfileEditForm> {
  Color containerColor = Colors.transparent;
  bool isMaleChecked = false;
  bool isFemaleChecked = false;
  bool isAct1 = false;
  bool isAct2 = false;
  bool isAct3 = false;
  bool isAct4 = false;
  bool isName = false;
  bool isWeight = false;
  bool isHeight = false;
  bool isAge = false;
  Color borderColor = Colors.grey;

  List<String> allergies = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String genderController = '';
  String activityLevelController = '';
  double bmiController = 0;

  void calculateBMI() {
  if (heightController.text.isNotEmpty && weightController.text.isNotEmpty) {
    double height = double.parse(heightController.text); 
    double weight = double.parse(weightController.text);
    height /= 100;
    double bmi = weight / (height * height);
    setState(() {
      bmiController = bmi; 
    });
  }
}

  void addAllergen(String allergen) {
    setState(() {
      allergies.add(allergen);
    });
  }

  void removeAllegen(String allergen) {
    setState(() {
      allergies.remove(allergen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(40, 30, 40, 10),
              child: Positioned(
                left: 0.09 * MediaQuery.of(context).size.width,
                top: 0.23 * MediaQuery.of(context).size.height,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Edit Profile',
                        style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1), 
                        fontSize: 22, 
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Mulish',
                      )),
                      IconButton(
                        icon: Image.asset(
                          'assets/profile/save.png',
                          height: 40,
                          width: 40,
                        ),
                        onPressed: () {
                          if (isMaleChecked) {
                            genderController = "Male";
                          } else {
                            genderController = "Female";
                          }

                          calculateBMI();

                          widget.updateProfile(
                            nameController.text,
                            int.parse(ageController.text),
                            int.parse(heightController.text),
                            int.parse(weightController.text),
                            genderController,
                            bmiController,
                            activityLevelController,
                            allergies
                          );
            
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  )
              ),
            ),
            // FIELD BUAT NAME
// ================================================================
            Container(
              margin: const EdgeInsets.fromLTRB(40, 13, 40, 2.5),
              child: Positioned(
                left: 0.09 * MediaQuery.of(context).size.width,
                top: 0.23 *
                    MediaQuery.of(context)
                        .size
                        .height, 
                child: const Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Additional text box
                    Text(
                      '  Name',
                      style: TextStyle(
                        // color: isName ? Colors.orange : Color.fromARGB(255, 40, 255, 40),
                        color: Color.fromRGBO(
                            0, 0, 0, 1), // Set text color to your preference
                        fontSize: 15, // Adjust font size as needed
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Mulish',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(30, 10, 28, 2),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    // Change the border color based on your preference
                    isName = true;
                    isAge = false;
                    isHeight = false;
                    isWeight = false;
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Additional text box
                    Container(
                      width: 0.83 *
                          MediaQuery.of(context)
                              .size
                              .width, // Adjust the width of the input box
                      height: 0.05 *
                          MediaQuery.of(context)
                              .size
                              .height, // Adjust the height of the input box
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            15), // Set circular border radius
                        border: Border.all(
                            color: Colors
                                .white), // Use the borderColor variable here
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            // border: InputBorder.none, // Hide input box border
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(color: Colors.orange),
                            ),
                            contentPadding: const EdgeInsets.fromLTRB(11, 0, 0, 3.5),
                          ),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z]')), // Allow only digits
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // FIELD BUAT HEIGHT AND WEIGHT
// ================================================================
            Container(
              margin: const EdgeInsets.fromLTRB(30, 10, 35, 2.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // FIELD BUAT HEIGHT
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '    Height',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Mulish',
                        ),
                      ),
                      const SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isName = false;
                            isAge = false;
                            isHeight =
                                true; // Change this to true to indicate height is selected
                            isWeight = false;
                          });
                        },
                        child: Container(
                          width: 0.38 * MediaQuery.of(context).size.width,
                          height: 0.05 * MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: isHeight ? Colors.white : Colors.white),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextField(
                              controller: heightController,
                              onChanged: (value) {
                                calculateBMI();
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(color: Colors.orange),
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(11, 0, 0, 3.5),
                              ),
                              keyboardType: const TextInputType.numberWithOptions(
                                  signed: true,
                                  decimal: false), // Allow only integers
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^[0-9]*$')), // Allow only digits
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // FIELD BUAT WEIGHT
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '   Weight',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Mulish',
                        ),
                      ),
                      const SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isName = false;
                            isAge = false;
                            isHeight =
                                false; // Change this to true to indicate height is selected
                            isWeight = true;
                          });
                        },
                        child: Container(
                          width: 0.40 * MediaQuery.of(context).size.width,
                          height: 0.05 * MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: isWeight ? Colors.white : Colors.white),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextField(
                              controller: weightController,
                              onChanged: (value) {
                                calculateBMI();
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(color: Colors.orange),
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(11, 0, 0, 3.5),
                              ),
                              keyboardType: const TextInputType.numberWithOptions(
                                  signed: true,
                                  decimal: false), // Allow only integers
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^[0-9]*$')), // Allow only digits
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // FIELD BUAT AGE AND SEX
// ================================================================
            Container(
              margin: const EdgeInsets.fromLTRB(30, 10, 40, 2.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // FIELD BUAT AGE
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '    Age',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Mulish',
                        ),
                      ),
                      const SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isName = false;
                            isAge = true;
                            isHeight =
                                false; // Change this to true to indicate height is selected
                            isWeight = false;
                          });
                        },
                        child: Container(
                          width: 0.39 * MediaQuery.of(context).size.width,
                          height: 0.05 * MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: isAge ? Colors.white : Colors.white),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextField(
                              controller: ageController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(color: Colors.orange),
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(11, 0, 0, 3.5),
                              ),
                              keyboardType: const TextInputType.numberWithOptions(
                                  signed: true,
                                  decimal: false), // Allow only integers
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^[0-9]*$')), // Allow only digits
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // FIELD BUAT SEX
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sex',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Mulish',
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isMaleChecked = true;
                                isFemaleChecked = false;
                                isName = false;
                                isAge = false;
                                isHeight = false;
                                isWeight = false;
                                genderController = 'Male';
                              });
                            },
                            child: Container(
                              width: 0.175 * MediaQuery.of(context).size.width,
                              height: 0.05 * MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                color: isMaleChecked
                                    ? Colors.orange
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: isMaleChecked
                                        ? Colors.orange
                                        : Colors.grey),
                              ),
                              child: Center(
                                child: Text(
                                  'M',
                                  style: TextStyle(
                                    color: isMaleChecked
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5), // Add space between "M" and "F"
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isMaleChecked = false;
                                isFemaleChecked = true;
                                genderController = 'Female';
                              });
                            },
                            child: Container(
                              width: 0.175 * MediaQuery.of(context).size.width,
                              height: 0.05 * MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                color: isFemaleChecked
                                    ? Colors.orange
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: isFemaleChecked
                                        ? Colors.orange
                                        : Colors.grey),
                              ),
                              child: Center(
                                child: Text(
                                  'F',
                                  style: TextStyle(
                                    color: isFemaleChecked
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // FIELD BUAT ACTIVITY LEVEL
// ================================================================

// FIELD BUAT ACTIVITY LEVEL
            Container(
              margin: const EdgeInsets.fromLTRB(40, 13, 40, 2.5),
              child: Positioned(
                left: 0.09 * MediaQuery.of(context).size.width,
                top: 0.5225 * MediaQuery.of(context).size.height,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Activity Level',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Mulish',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // First Row: Sedentary and Lightly Active
            Container(
              margin: const EdgeInsets.fromLTRB(40, 2.5, 40, 2.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Option Sedentary
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isAct1 = true;
                        isAct2 = false;
                        isAct3 = false;
                        isAct4 = false;
                        isName = false;
                        isAge = false;
                        isHeight = false;
                        isWeight = false;
                        activityLevelController = 'Sedentary';
                      });
                    },
                    child: Container(
                      width: 0.385 * MediaQuery.of(context).size.width,
                      height: 0.08 * MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: isAct1 ? Colors.orange : Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: isAct1 ? Colors.orange : Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          'Sedentary\n(little to no exercise)',
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: TextStyle(
                            color: isAct1 ? Colors.white : Colors.grey,
                            fontSize: 12,
                            fontFamily: 'Mulish',
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Option Lightly Active
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isAct1 = false;
                        isAct2 = true;
                        isAct3 = false;
                        isAct4 = false;
                        isName = false;
                        isAge = false;
                        isHeight = false;
                        isWeight = false;
                        activityLevelController = 'Light';
                      });
                    },
                    child: Container(
                      width: 0.385 * MediaQuery.of(context).size.width,
                      height: 0.08 * MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: isAct2 ? Colors.orange : Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: isAct2 ? Colors.orange : Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          'Lightly active\n(1-2 times a week)',
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: TextStyle(
                            color: isAct2 ? Colors.white : Colors.grey,
                            fontSize: 12,
                            fontFamily: 'Mulish',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Second Row: Moderately Active and Very Active
            Container(
              margin: const EdgeInsets.fromLTRB(40, 5, 40, 2.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Option Moderately Active
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isAct1 = false;
                        isAct2 = false;
                        isAct3 = true;
                        isAct4 = false;
                        isName = false;
                        isAge = false;
                        isHeight = false;
                        isWeight = false;
                        activityLevelController = 'Moderate';
                      });
                    },
                    child: Container(
                      width: 0.385 * MediaQuery.of(context).size.width,
                      height: 0.08 * MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: isAct3 ? Colors.orange : Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: isAct3 ? Colors.orange : Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          'Moderately active\n(3-5 times a week)',
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: TextStyle(
                            color: isAct3 ? Colors.white : Colors.grey,
                            fontSize: 12,
                            fontFamily: 'Mulish',
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Option Very Active
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isAct1 = false;
                        isAct2 = false;
                        isAct3 = false;
                        isAct4 = true;
                        isName = false;
                        isAge = false;
                        isHeight = false;
                        isWeight = false;
                        activityLevelController = 'Active';
                      });
                    },
                    child: Container(
                      width: 0.385 * MediaQuery.of(context).size.width,
                      height: 0.08 * MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: isAct4 ? Colors.orange : Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: isAct4 ? Colors.orange : Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          'Very active\n(6-7 times a week)',
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: TextStyle(
                            color: isAct4 ? Colors.white : Colors.grey,
                            fontSize: 12,
                            fontFamily: 'Mulish',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

// ================================================================================================================
// ===== Allergies section =========
            Container(
              margin: const EdgeInsets.fromLTRB(40, 13, 40, 20),
              child: Positioned(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Allergies',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Mulish',
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 7.5),
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 20, right: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFCDFB5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Wrap(
                                  spacing: 12.0,
                                  runSpacing: 10.0,
                                  children: [
                                    for (String allergen in allergies)
                                      SizedBox(
                                        height: 37,
                                        child: Chip(
                                          label: Text(
                                            allergen,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white,
                                              fontFamily: 'Mulish',
                                            ),
                                          ),
                                          backgroundColor:
                                              const Color(0xFFFEA72D),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(17),
                                            side: const BorderSide(
                                                style: BorderStyle.none),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          deleteIconColor: Colors.white,
                                          deleteIcon: SvgPicture.asset(
                                            'assets/formAllergiesAssets/Button Shape.svg',
                                            width: 10,
                                            height: 10,
                                          ),
                                          onDeleted: () =>
                                              removeAllegen(allergen),
                                        ),
                                      ),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            String newAllergen = '';
                                            return AlertDialog(
                                              backgroundColor: Colors.white,
                                              surfaceTintColor:
                                                  Colors.transparent,
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      20, 20, 20, 20),
                                              title: const Text(
                                                'Add Allergens',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Mulish',
                                                ),
                                              ),
                                              content: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  border: Border.all(
                                                      color: const Color(0xFFAFB1B6)),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: TextField(
                                                        onChanged: (value) {
                                                          // Remove leading and trailing whitespace
                                                          value = value.trim();
                                                          // Validate input
                                                          if (value
                                                                  .isNotEmpty &&
                                                              RegExp(r'^[a-zA-Z]+$')
                                                                  .hasMatch(
                                                                      value)) {
                                                            // Input is not empty and contains only alphabets
                                                            newAllergen = value;
                                                          } else {
                                                            // Input is invalid or empty, clear the value
                                                            newAllergen = '';
                                                          }
                                                        },
                                                        decoration:
                                                            const InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20),
                                                          hintText:
                                                              'Type Here...',
                                                          hintStyle: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'Mulish',
                                                          ),
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 20),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          if (newAllergen
                                                              .isNotEmpty) {
                                                            // Check if newAllergen is not empty
                                                            addAllergen(
                                                                newAllergen);
                                                          }
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: SvgPicture.asset(
                                                          'assets/formAllergiesAssets/Button Shape-1.svg',
                                                          width: 14.5,
                                                          height: 14.5,
                                                          color:
                                                              const Color(0xFF272525),
                                                          alignment:
                                                              Alignment.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 37,
                                        height: 37,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFFFEA72D),
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset(
                                            'assets/formAllergiesAssets/Button Shape-1.svg',
                                            width: 14.5,
                                            height: 14.5,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

