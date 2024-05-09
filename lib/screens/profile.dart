import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class InfoCard extends StatelessWidget {
  final String label;
  final String value;
  final String iconPath;

  const InfoCard({Key? key, required this.label, required this.value, required this.iconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color.fromRGBO(255, 246, 235, 1),
      ),
      padding: EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, width: 36, height: 36),
          SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, textAlign: TextAlign.left,
                style: TextStyle( 
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color.fromRGBO(247, 145, 1, 0.6),
                ), 
              ),
              Text(value, textAlign: TextAlign.left,
                style: TextStyle( 
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Color.fromRGBO(247, 145, 1, 1),
                ), 
              ),
            ],
          )
        ]
      ),
    );
  }
}

class BMIIndicator extends StatelessWidget {
  final double bmi;

  const BMIIndicator({Key? key, required this.bmi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BMI', style: TextStyle(color: Colors.grey[700], fontSize: 14)),
            SizedBox(height: 4),
            Text(bmi.toStringAsFixed(1), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}


class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'Maddie';
  String age = '20 y.o.';
  String gender = 'Female';
  String height = '161cm';
  String weight = '45kg';
  double bmi = 17.4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // == APP BAR == // 
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/profile/back.png', width:26, height:26), 
          onPressed: () {
            // Add functionality to go back
          },
        ),
        title: Text('Profile', textAlign: TextAlign.center, 
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
            padding: EdgeInsets.only(right:10.0),
            child:GestureDetector(
              onTap:(){

              },
              child: Image.asset('assets/profile/edit.png', width:26, height:26)
            )
          )
        ],
      ),

       
      body: SingleChildScrollView(
        child: Column(

          // == PROFILE PICTURE AND NAME == //
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[200],
              child: Text(name[0], style:TextStyle(fontSize:40, color: Color.fromRGBO(187, 191, 194, 1))), // Displays the first letter of the name
            ),
            SizedBox(height: 10),
            Text(name, 
              style: TextStyle(
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: Color.fromRGBO(247, 145, 1, 1),
              ),
            ),

            SizedBox(height: 4),

            // == AGE, GENDER, WEIGHT, HEIGHT == //
            GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(32),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              crossAxisCount: 2,
              childAspectRatio: (2/1),

              children: <Widget>[
                InfoCard(label: 'Age', value: age, iconPath: 'assets/profile/date.png',),
                InfoCard(label: 'Gender', value: gender, iconPath: 'assets/profile/gender.png'),
                InfoCard(label: 'Height', value: height, iconPath: 'assets/profile/height.png'),
                InfoCard(label: 'Weight', value: weight, iconPath: 'assets/profile/weight.png'),
                // InfoCard(label: 'Activity Level', value: 'Moderate'),
                BMIIndicator(bmi: bmi),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Chip(label: Text('Dairy')),
                  Chip(label: Text('Peanuts')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

