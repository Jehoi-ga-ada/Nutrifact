import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart'; // Add this import for TextInputFormatter


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

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  Color containerColor = Colors.transparent;

  List<String> allergies = [];

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

      // Back button
// ================================================================
            Container(
              margin: EdgeInsets.fromLTRB(30, 40, 0, 0),
              child: Positioned(
                left: 0.06 * MediaQuery.of(context).size.width,
                top: 0.06 * MediaQuery.of(context).size.height,
                child: InkWell(
                  onTap: () {
                    // Handle back button tap
                  },
                  child: Image.asset(
                    'assets/formInfoDetailAssets/arrow-left-1.png',
                    width: 0.06 * MediaQuery.of(context).size.width,
                    height: 0.06 * MediaQuery.of(context).size.height,
                  ),
                ),
              ),
            ),

        // FOR Title and subtext
// ================================================================
        Container(
          margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
            child : Positioned(
              left: 0.07 * MediaQuery.of(context).size.width,
              top: 0.11 * MediaQuery.of(context).size.height, // Adjust the top position for the "Tell us more!" text
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tell us more text
                  const Text(
                    'Tell us more!',
                    style: TextStyle(
                      color: Colors.orange, // Set text color to orange
                      fontSize: 34, // Adjust font size as needed
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Mulish',
                    ),
                  ),
                  SizedBox(height: 0.0000001 * MediaQuery.of(context).size.height), // Spacer between "Tell us more!" and "So we can know you better."
                  // SizedBox(height: 20),
                  // Subtext
                  Text(
                    'So we can know you better.',
                    style: TextStyle(
                      fontSize: 18, // Adjust font size as needed
                      color: Colors.yellow[700],
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Mulish',
                    ),
                  ),
                ],
              ),
            ),
          ),

      // FIELD BUAT NAME
// ================================================================
        Container(
          margin: EdgeInsets.fromLTRB(40, 10, 40, 2.5),
          child : Positioned(
            left: 0.09 * MediaQuery.of(context).size.width,
            top: 0.23 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Additional text box
                Text(
                  '  Name',
                  style: TextStyle(
                    // color: isName ? Colors.orange : Color.fromARGB(255, 40, 255, 40),
                    color: Color.fromRGBO(0, 0, 0, 1), // Set text color to your preference
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
        margin: EdgeInsets.fromLTRB(30, 10, 28, 2),
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
                width: 0.83 * MediaQuery.of(context).size.width, // Adjust the width of the input box
                height: 0.05 * MediaQuery.of(context).size.height, // Adjust the height of the input box
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), // Set circular border radius
                  border: Border.all(color: Colors.white), // Use the borderColor variable here
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      // border: InputBorder.none, // Hide input box border
                     enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:  BorderSide(color: Colors.grey),
                            ),
                      focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:  BorderSide(color: Colors.orange),
                      ),
                      ),
                         inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')), // Allow only digits
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
            margin: EdgeInsets.fromLTRB(30, 10, 35, 2.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [


                // FIELD BUAT HEIGHT
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '    Height',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Mulish',
                      ),
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isName = false;
                          isAge = false;
                          isHeight = true; // Change this to true to indicate height is selected
                          isWeight = false;
                        });
                      },
                    child : Container(
                      width: 0.38 * MediaQuery.of(context).size.width,
                      height: 0.05 * MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: isHeight ? Colors.white : Colors.white),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:  BorderSide(color: Colors.grey),
                            ),
                      focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:  BorderSide(color: Colors.orange),
                            ),
                          ),
                           keyboardType: TextInputType.numberWithOptions(signed: true, decimal: false), // Allow only integers
                            inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$')), // Allow only digits
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
                    Text(
                      '   Weight',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Mulish',
                      ),
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isName = false;
                          isAge = false;
                          isHeight = false; // Change this to true to indicate height is selected
                          isWeight = true;
                        });
                      },
                    child : Container(
                      width: 0.40 * MediaQuery.of(context).size.width,
                      height: 0.05 * MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: isWeight ? Colors.white : Colors.white),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:  BorderSide(color: Colors.grey),
                            ),
                      focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:  BorderSide(color: Colors.orange),
                          ),
                          ),
                           keyboardType: TextInputType.numberWithOptions(signed: true, decimal: false), // Allow only integers
                            inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$')), // Allow only digits
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
            margin: EdgeInsets.fromLTRB(30, 10, 40, 2.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                // FIELD BUAT AGE
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '    Age',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Mulish',
                      ),
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isName = false;
                          isAge = true;
                          isHeight = false; // Change this to true to indicate height is selected
                          isWeight = false;
                        });
                      },
                    child : Container(
                      width: 0.39 * MediaQuery.of(context).size.width,
                      height: 0.05 * MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: isAge? Colors.white : Colors.white),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:  BorderSide(color: Colors.grey),
                            ),
                      focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:  BorderSide(color: Colors.orange),
                          ),
                          ),
                           keyboardType: TextInputType.numberWithOptions(signed: true, decimal: false), // Allow only integers
                            inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$')), // Allow only digits
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
                    Text(
                      'Sex',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Mulish',
                      ),
                    ),
                    SizedBox(height: 5),
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
                            });
                          },
                          child: Container(
                            width: 0.175 * MediaQuery.of(context).size.width,
                            height: 0.05 * MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: isMaleChecked ? Colors.orange : Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: isMaleChecked ? Colors.orange : Colors.grey),
                            ),
                            child: Center(
                              child: Text(
                                'M',
                                style: TextStyle(
                                  color: isMaleChecked ? Colors.white : Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5), // Add space between "M" and "F"
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isMaleChecked = false;
                              isFemaleChecked = true;
                            });
                          },
                          child: Container(
                            width: 0.175 * MediaQuery.of(context).size.width,
                            height: 0.05 * MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: isFemaleChecked ? Colors.orange : Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: isFemaleChecked ? Colors.orange : Colors.grey),
                            ),
                            child: Center(
                              child: Text(
                                'F',
                                style: TextStyle(
                                  color: isFemaleChecked ? Colors.white : Colors.grey,
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
            margin: EdgeInsets.fromLTRB(40, 10, 40, 2.5),
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
            margin: EdgeInsets.fromLTRB(40, 2.5, 40, 2.5),
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
                    });
                  },
                  child: Container(
                    width: 0.385 * MediaQuery.of(context).size.width,
                    height: 0.08 * MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: isAct1 ? Colors.orange : Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: isAct1 ? Colors.orange : Colors.grey),
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
                    });
                  },
                  child: Container(
                    width: 0.385 * MediaQuery.of(context).size.width,
                    height: 0.08 * MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: isAct2 ? Colors.orange : Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: isAct2 ? Colors.orange : Colors.grey),
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
            margin: EdgeInsets.fromLTRB(40, 5, 40, 2.5),
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
                    });
                  },
                  child: Container(
                    width: 0.385 * MediaQuery.of(context).size.width,
                    height: 0.08 * MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: isAct3 ? Colors.orange : Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: isAct3 ? Colors.orange : Colors.grey),
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
                    });
                  },
                  child: Container(
                    width: 0.385 * MediaQuery.of(context).size.width,
                    height: 0.08 * MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: isAct4 ? Colors.orange : Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: isAct4 ? Colors.orange : Colors.grey),
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
        margin: EdgeInsets.fromLTRB(40, 10, 40, 20),
        child : Positioned(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Allergies',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Mulish',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 7.5),
                padding: EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
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
                                Container(
                                  height: 37,
                                  child: Chip(
                                    label: Text(
                                      allergen,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                        fontFamily: 'Mulish',
                                      ),
                                    ),
                                    backgroundColor: const Color(0xFFFEA72D),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(17),
                                      side: BorderSide(style: BorderStyle.none),
                                    ),
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    deleteIconColor: Colors.white,
                                    deleteIcon: SvgPicture.asset(
                                      'assets/formAllergiesAssets/Button Shape.svg',
                                      width: 10,
                                      height: 10,
                                    ),
                                    onDeleted: () => removeAllegen(allergen),
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
                                        surfaceTintColor: Colors.transparent,
                                        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                        title: Text(
                                          'Add Allergens',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Mulish',
                                          ),
                                        ),
                                        content: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            border: Border.all(color: Color(0xFFAFB1B6)),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: TextField(
                                                  onChanged: (value) {
                                                    // Remove leading and trailing whitespace
                                                    value = value.trim();
                                                    // Validate input
                                                    if (value.isNotEmpty && RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                                                      // Input is not empty and contains only alphabets
                                                      newAllergen = value;
                                                    } else {
                                                      // Input is invalid or empty, clear the value
                                                      newAllergen = '';
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                                    hintText: 'Type Here...',
                                                    hintStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Mulish',
                                                    ),
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    if (newAllergen.isNotEmpty) { // Check if newAllergen is not empty
                                                      addAllergen(newAllergen);
                                                  }
                                              Navigator.of(context).pop();
                                            },
                                                  child: SvgPicture.asset(
                                                    'assets/formAllergiesAssets/Button Shape-1.svg',
                                                    width: 14.5,
                                                    height: 14.5,
                                                    color: Color(0xFF272525),
                                                    alignment: Alignment.center,
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
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xFFFEA72D),
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

  // All good Button
  // ==============================
      Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          width: double.infinity, // Make the container fill the width
          margin: EdgeInsets.only(top: 10, bottom: 30), // Apply margins
          child: ElevatedButton(
            onPressed: () {
              // Add your functionality here
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFF8233)), // Button color
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'All good!',
                style: TextStyle(
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),

          ],
        ),
      ),
    );
  }
}
