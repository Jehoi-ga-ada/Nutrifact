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
              Text(
                'Tell us more!',
                style: TextStyle(
                  color: Colors.orange, // Set text color to orange
                  fontSize: 25, // Adjust font size as needed
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Mulish',
                ),
              ),
              SizedBox(height: 0.003 * MediaQuery.of(context).size.height), // Spacer between "Tell us more!" and "So we can know you better."

              // Subtext
              Text(
                'So we can know you better.',
                style: TextStyle(
                  fontSize: 14, // Adjust font size as needed
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Mulish',
                ),
              ),
            ],
          ),
        ),


        Positioned(
          left: 0.09 * MediaQuery.of(context).size.width,
          top: 0.21 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Additional text box
              Text(
                'Name',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1), // Set text color to your preference
                  fontSize: 18, // Adjust font size as needed
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),


        Positioned(
          left: 0.07 * MediaQuery.of(context).size.width,
          top: 0.25 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
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
          top: 0.31 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Additional text box
              Text(
                'Height',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1), // Set text color to your preference
                  fontSize: 18, // Adjust font size as needed
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        

        Positioned(
          left: 0.07 * MediaQuery.of(context).size.width,
          top: 0.35 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
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
          top: 0.31 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Additional text box
              Text(
                'Weight',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1), // Set text color to your preference
                  fontSize: 18, // Adjust font size as needed
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        

        Positioned(
          left: 0.5 * MediaQuery.of(context).size.width,
          top: 0.35 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
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
          top: 0.417 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Additional text box
              Text(
                'Age',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1), // Set text color to your preference
                  fontSize: 18, // Adjust font size as needed
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        

        Positioned(
          left: 0.07 * MediaQuery.of(context).size.width,
          top: 0.46 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
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
          top: 0.417 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Additional text box
              Text(
                'Sex',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1), // Set text color to your preference
                  fontSize: 18, // Adjust font size as needed
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        // Color: Color(0xFFD47D0A);

        Positioned(
          left: 0.52 * MediaQuery.of(context).size.width,
          top: 0.417 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Additional text box
                Text(
                  'Sex',
                  style: TextStyle(
                    color: Colors.black, // Use containerColor to set text color
                    fontSize: 18, // Adjust font size as needed
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

       Positioned(
        left: 0.5 * MediaQuery.of(context).size.width,
        top: 0.46 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
        child: GestureDetector(
          onTap: () {
            setState(() {
              isMaleChecked = true;
              isFemaleChecked = false;
            });
          },
          child: Container(
            width: 0.19 * MediaQuery.of(context).size.width, // Adjust the width of the input box
            height: 0.05 * MediaQuery.of(context).size.height, // Adjust the height of the input box
            decoration: BoxDecoration(
              color: isMaleChecked ? Colors.orange : Colors.transparent, // Set color based on state
              borderRadius: BorderRadius.circular(15), // Set circular border radius
              border: Border.all(color: Colors.grey), // Set border color
            ),
            child: const Center(
              child: Text(
                'M', // Letter "M" inside the container
                style: TextStyle(
                  color: Colors.black, // Set default text color
                  fontSize: 20, // Adjust font size as needed
                ),
              ),
            ),
          ),
        ),
      ),

      Positioned(
        left: 0.71 * MediaQuery.of(context).size.width,
        top: 0.46 * MediaQuery.of(context).size.height, // Adjust the top position for the additional text box
        child: GestureDetector(
          onTap: () {
            setState(() {
              isMaleChecked = false;
              isFemaleChecked = true;
            });
          },
          child: Container(
            width: 0.19 * MediaQuery.of(context).size.width, // Adjust the width of the input box
            height: 0.05 * MediaQuery.of(context).size.height, // Adjust the height of the input box
            decoration: BoxDecoration(
              color: isFemaleChecked ? Colors.orange : Colors.transparent, // Set color based on state
              borderRadius: BorderRadius.circular(15), // Set circular border radius
              border: Border.all(color: Colors.grey), // Set border color
            ),
            child: const Center(
              child: Text(
                'F', // Letter "F" inside the container
                style: TextStyle(
                  color: Colors.black, // Set default text color
                  fontSize: 20, // Adjust font size as needed
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