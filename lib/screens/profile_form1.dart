// import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// class Profile11 extends StatelessWidget {
//   const Profile11({super.key});

//  @override
// Widget build(BuildContext context) {
//   return Scaffold(
    // appBar: AppBar(
      // Title and other app bar settings
    // ),

    import 'package:flutter/material.dart';

    // void main() {
    //   runApp(ProfilePage());
    // }

    bool isMaleChecked = false;
    bool isFemaleChecked = false;
    bool isAct1 = false;
    bool isAct2 = false;
    bool isAct3 = false;
    bool isAct4 = false;
    bool isTest = false;
    bool isTest2 = false;

    class Profile11 extends StatefulWidget {
      const Profile11({Key? key}) : super(key: key);

      @override
      _ProfilePageState createState() => _ProfilePageState();
    }

    class _ProfilePageState extends State<Profile11> {
      Color containerColor = Colors.transparent; // Default color // Default color

      @override
      Widget build(BuildContext context) {
        return Scaffold(

    body: Stack(
      children: [
        Positioned(
          left: 0.06 * MediaQuery.of(context).size.width,
          top: 0.06 * MediaQuery.of(context).size.height, // Adjust the top position for the button
          child: InkWell(
            onTap: () {
              // Handle button tap
            },
            child: Image.asset(
              'assets/arrow-left-1.png', // Adjust the image path
              width: 0.04 * MediaQuery.of(context).size.width,
              height: 0.04 * MediaQuery.of(context).size.height,
            ),
          ),
        ),

        Positioned(
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


        Positioned(
          left: 0.09 * MediaQuery.of(context).size.width,
          top: 0.23 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Additional text box
              Text(
                'Name',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1), // Set text color to your preference
                  fontSize: 15, // Adjust font size as needed
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Mulish',
                ),
              ),
            ],
          ),
        ),


        Positioned(
          left: 0.07 * MediaQuery.of(context).size.width,
          top: 0.265 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
          child: Container(
            width: 0.83 * MediaQuery.of(context).size.width, // Adjust the width of the input box
            height: 0.05 * MediaQuery.of(context).size.height, // Adjust the height of the input box
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), // Set circular border radius
              border: Border.all(color: Colors.grey), // Set border color
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none, // Hide input box border
                ),
              ),
            ),
          ),
        ),


        Positioned(
          left: 0.09 * MediaQuery.of(context).size.width,
          top: 0.325 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Additional text box
              Text(
                'Height',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1), // Set text color to your preference
                  fontSize: 15, // Adjust font size as needed
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Mulish',
                ),
              ),
            ],
          ),
        ),
        

        Positioned(
          left: 0.07 * MediaQuery.of(context).size.width,
          top: 0.36 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
          child: Container(
            width: 0.37 * MediaQuery.of(context).size.width, // Adjust the width of the input box
            height: 0.05 * MediaQuery.of(context).size.height, // Adjust the height of the input box
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), // Set circular border radius
              border: Border.all(color: Colors.grey), // Set border color
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none, // Hide input box border
                ),
              ),
            ),
          ),
        ),


        Positioned(
          left: 0.52 * MediaQuery.of(context).size.width,
          top: 0.325 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Additional text box
              Text(
                'Weight',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1), // Set text color to your preference
                  fontSize: 15, // Adjust font size as needed
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Mulish',
                ),
              ),
            ],
          ),
        ),
        

        Positioned(
          left: 0.5 * MediaQuery.of(context).size.width,
          top: 0.36 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
          child: Container(
            width: 0.4 * MediaQuery.of(context).size.width, // Adjust the width of the input box
            height: 0.05 * MediaQuery.of(context).size.height, // Adjust the height of the input box
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), // Set circular border radius
              border: Border.all(color: Colors.grey), // Set border color
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none, // Hide input box border
                ),
              ),
            ),
          ),
        ),


        Positioned(
          left: 0.09 * MediaQuery.of(context).size.width,
          top: 0.42 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Additional text box
              Text(
                'Age',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1), // Set text color to your preference
                  fontSize: 15, // Adjust font size as needed
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Mulish',
                ),
              ),
            ],
          ),
        ),
        

        Positioned(
          left: 0.07 * MediaQuery.of(context).size.width,
          top: 0.456 * MediaQuery.of(context).size.height,
          child: GestureDetector(
          onTap: () {
            setState(() {
              isTest = true;
              isMaleChecked = false;
              isFemaleChecked = false;
            });
          }, // Adjust the top position for the additional text box
          child: Container(
            width: 0.37 * MediaQuery.of(context).size.width, // Adjust the width of the input box
            height: 0.05 * MediaQuery.of(context).size.height, // Adjust the height of the input box
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), // Set circular border radius
              border: Border.all(color: isTest ? Colors.orange : Colors.grey), // Set border color
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none, // Hide input box border
                ),
              ),
            ),
          ),
          ),
        ),


        Positioned(
          left: 0.52 * MediaQuery.of(context).size.width,
          top: 0.421 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Additional text box
                Text(
                  'Sex',
                  style: TextStyle(
                    color: Colors.black, // Use containerColor to set text color
                    fontSize: 15, // Adjust font size as needed
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Mulish',
                  ),
                ),
              ],
            ),
          ),

       Positioned(
        left: 0.5 * MediaQuery.of(context).size.width,
        top: 0.456 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
        child: GestureDetector(
          onTap: () {
            setState(() {
              isMaleChecked = true;
              isFemaleChecked = false;
              isTest = false;
            });
          },
          child: Container(
            width: 0.19 * MediaQuery.of(context).size.width, // Adjust the width of the input box
            height: 0.05 * MediaQuery.of(context).size.height, // Adjust the height of the input box
            decoration: BoxDecoration(
              color: isMaleChecked ? Colors.orange : Colors.transparent, // Set color based on state
              borderRadius: BorderRadius.circular(15), // Set circular border radius
              border: Border.all(color: isMaleChecked ? Colors.orange : Colors.grey), // Set border color
            ),
            child: Center(
              child: Text(
                'M', // Letter "M" inside the container
                style: TextStyle(
                  color: isMaleChecked ? Colors.white : Colors.grey, // Set default text color
                  fontSize: 20, // Adjust font size as needed
                ),
              ),
            ),
          ),
        ),
      ),

      Positioned(
        left: 0.71 * MediaQuery.of(context).size.width,
        top: 0.456 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
        child: GestureDetector(
          onTap: () {
            setState(() {
              isMaleChecked = false;
              isFemaleChecked = true;
              isTest = false;
            });
          },
          child: Container(
            width: 0.19 * MediaQuery.of(context).size.width, // Adjust the width of the input box
            height: 0.05 * MediaQuery.of(context).size.height, // Adjust the height of the input box
            decoration: BoxDecoration(
            color: isFemaleChecked ? Colors.orange : Colors.transparent, // Set color based on state
            borderRadius: BorderRadius.circular(15), // Set circular border radius
            border: Border.all(color: isFemaleChecked ? Colors.orange : Colors.grey), // Set border color
            ),
            child: Center(
              child: Text(
                'F', // Letter "F" inside the container
                style: TextStyle(
                  color: isFemaleChecked ? Colors.white : Colors.grey, // Set default text color
                  fontSize: 20, // Adjust font size as needed
                ),
              ),
            ),
          ),
        ),
      ),
        

      Positioned(
          left: 0.09 * MediaQuery.of(context).size.width,
          top: 0.5225 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Additional text box
              Text(
                'Activity Level',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1), // Set text color to your preference
                  fontSize: 15, // Adjust font size as needed
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Mulish',
                ),
              ),
            ],
          ),
        ),

        Positioned(
          left: 0.07 * MediaQuery.of(context).size.width,
          top: 0.562 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
          child: GestureDetector(
            onTap: () {
              setState(() {
                isAct1 = true;
                isAct2 = false;
                isAct3 = false;
                isAct4 = false;
              });
            },
            child: Container(
              width: 0.4 * MediaQuery.of(context).size.width, // Adjust the width of the input box
              height: 0.08 * MediaQuery.of(context).size.height, // Adjust the height of the input box to fit two lines
              decoration: BoxDecoration(
                color: isAct1 ? Colors.orange : Colors.transparent, // Set color based on state
                borderRadius: BorderRadius.circular(15), // Set circular border radius
                border: Border.all(color: isAct1 ? Colors.orange : Colors.grey), // Set border color
              ),
              child: Center(
                child: Text(
                  'Sedentary\nlittle to no exercise', // Text with a new line for second line
                  textAlign: TextAlign.center, // Align text to the center
                  softWrap: true, // Allow text to wrap if it exceeds container width
                  style: TextStyle(
                    color: isAct1 ? Colors.white : Colors.grey, // Set default text color
                    fontSize: 12, // Adjust font size as needed
                  ),
                ),
              ),
            ),
          ),
        ),


        Positioned(
          left: 0.5 * MediaQuery.of(context).size.width,
          top: 0.562 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
          child: GestureDetector(
            onTap: () {
              setState(() {
                isAct1 = false;
                isAct2 = true;
                isAct3 = false;
                isAct4 = false;
              });
            },
            child: Container(
              width: 0.4 * MediaQuery.of(context).size.width, // Adjust the width of the input box
              height: 0.08 * MediaQuery.of(context).size.height, // Adjust the height of the input box to fit two lines
              decoration: BoxDecoration(
                color: isAct2 ? Colors.orange : Colors.transparent, // Set color based on state
                borderRadius: BorderRadius.circular(15), // Set circular border radius
                border: Border.all(color: isAct2 ? Colors.orange : Colors.grey), // Set border color
              ),
              child: Center(
                child: Text(
                  'Lightly active\n(1-2 times a week)', // Text with a new line for second line
                  textAlign: TextAlign.center, // Align text to the center
                  softWrap: true, // Allow text to wrap if it exceeds container width
                  style: TextStyle(
                    color: isAct2 ? Colors.white : Colors.grey, // Set default text color
                    fontSize: 12, // Adjust font size as needed
                  ),
                ),
              ),
            ),
          ),
        ),


        Positioned(
          left: 0.07 * MediaQuery.of(context).size.width,
          top: 0.66 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
          child: GestureDetector(
            onTap: () {
              setState(() {
                isAct1 = false;
                isAct2 = false;
                isAct3 = true;
                isAct4 = false;
              });
            },
            child: Container(
              width: 0.4 * MediaQuery.of(context).size.width, // Adjust the width of the input box
              height: 0.08 * MediaQuery.of(context).size.height, // Adjust the height of the input box to fit two lines
              decoration: BoxDecoration(
                color: isAct3 ? Colors.orange : Colors.transparent, // Set color based on state
                borderRadius: BorderRadius.circular(15), // Set circular border radius
                border: Border.all(color: isAct3 ? Colors.orange : Colors.grey), // Set border color
              ),
              child: Center(
                child: Text(
                  'Moderately active\n(3-5 times a week)', // Text with a new line for second line
                  textAlign: TextAlign.center, // Align text to the center
                  softWrap: true, // Allow text to wrap if it exceeds container width
                  style: TextStyle(
                    color: isAct3 ? Colors.white : Colors.grey, // Set default text color
                    fontSize: 12, // Adjust font size as needed
                  ),
                ),
              ),
            ),
          ),
        ),


        Positioned(
          left: 0.5 * MediaQuery.of(context).size.width,
          top: 0.66 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
          child: GestureDetector(
            onTap: () {
              setState(() {
                isAct1 = false;
                isAct2 = false;
                isAct3 = false;
                isAct4 = true;
              });
            },
            child: Container(
              width: 0.4 * MediaQuery.of(context).size.width, // Adjust the width of the input box
              height: 0.08 * MediaQuery.of(context).size.height, // Adjust the height of the input box to fit two lines
              decoration: BoxDecoration(
                color: isAct4 ? Colors.orange : Colors.transparent, // Set color based on state
                borderRadius: BorderRadius.circular(15), // Set circular border radius
                border: Border.all(color: isAct4 ? Colors.orange : Colors.grey), // Set border color
              ),
              child: Center(
                child: Text(
                  'Very active\n(6-7 times a week)', // Text with a new line for second line
                  textAlign: TextAlign.center, // Align text to the center
                  softWrap: true, // Allow text to wrap if it exceeds container width
                  style: TextStyle(
                    color: isAct4 ? Colors.white : Colors.grey, // Set default text color
                    fontSize: 12, // Adjust font size as needed
                  ),
                ),
              ),
            ),
          ),
        ),

      ],
    ),
  );
}
}