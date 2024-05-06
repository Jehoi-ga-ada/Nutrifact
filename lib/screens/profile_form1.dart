import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

class Profile11 extends StatelessWidget {
  const Profile11({super.key});

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      // Title and other app bar settings
    ),
    body: Stack(
      children: [
        Positioned(
          left: 17,
          top: 2, // Adjust the top position for the button
          child: InkWell(
            onTap: () {
              // Handle button tap
            },
            child: Image.asset(
              'assets/arrow-left-1.png', // Adjust the image path
              width: 24,
              height: 25,
            ),
          ),
        ),
        const Positioned(
          left: 25,
          top: 40, // Adjust the top position for the text
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tell us more text
              Text(
                'Tell us more!',
                style: TextStyle(
                  color: Colors.orange, // Set text color to orange
                  fontSize: 25, // Adjust font size as needed
                  fontWeight: FontWeight.bold, // Make text bold
                ),
              ),
              SizedBox(height: 8), // Spacer between texts

              // Subtext
              Text(
                'So we can know you better.',
                style: TextStyle(
                  fontSize: 14, // Adjust font size as needed
                  fontStyle: FontStyle.italic, // Make text italic
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}