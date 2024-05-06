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
            left: 15,
            top: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image button
                InkWell(
                  onTap: () {
                    // Handle button tap
                  },
                  child: Image.asset(
                    'assets/arrow-left-1.png', // Adjust the image path
                    width: 24,
                    height: 24,
                  ),
                ),
                const SizedBox(height: 16), // Spacer between image button and text

                // Tell us more text
                const Text(
                  'Tell us more!',
                  style: TextStyle(
                    color: Colors.orange, // Set text color to orange
                    fontSize: 25, // Adjust font size as needed
                    fontWeight: FontWeight.bold, // Make text bold
                  ),
                ),
                const SizedBox(height: 8), // Spacer between texts

                // Subtext
                const Text(
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