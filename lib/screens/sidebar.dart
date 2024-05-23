import 'package:flutter/material.dart';
// import 'package:is_first_run/is_first_run.dart';
import 'package:nutrifact/screens/profile.dart';
import 'package:nutrifact/screens/profile_form.dart';
import 'package:nutrifact/models/profile_model.dart';
import 'package:nutrifact/utils/profile_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  Profile? profile;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final ProfileStorage storage = ProfileStorage();
    Profile loadedProfile = await storage.readProfile();
    setState(() {
      profile = loadedProfile;
    });
  }

  Future<void> goToProfile() async {
    // final ProfileStorage storage = ProfileStorage();
    // Profile profile = await storage.readProfile();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      if(mounted){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileForm()),
        );
      }
    } else if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  ProfileScreen(
          profile: profile!,
          )),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Drawer(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0.05 * width),
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 0.04 * height, 
                        bottom: 0.04 * height,
                      ),
                      child: Image.asset(
                        'assets/sidebar/back_button.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                
                Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.only(
                    top: 0.02*height,
                    bottom: 0.01*height, 
                    left: 0.04*width
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 45, // half of currentAccountPictureSize
                        backgroundColor: Colors.transparent,
                        // child: ClipOval(
                        //   child: Image.network(
                        //     'https://i.pinimg.com/736x/86/d3/e2/86d3e24b8647e52cc6c815a52ff6e445.jpg',
                        //     fit: BoxFit.cover,
                        //     width: 90, // currentAccountPictureSize.width
                        //     height: 90, // currentAccountPictureSize.height
                        //   ),
                        // ),
                        child: Text(profile?.name[0] ?? 'G',
                          style: const TextStyle(
                              fontSize: 40,
                              color: Color.fromRGBO(187, 191, 194, 1))), 
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, top: 5),
                        child: Text(
                          profile?.name ?? 'Guest',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 0.01*height),

                GestureDetector(
                  onTap:() => goToProfile(),
                  child: const ListTile(
                    title: Text(
                      "Profile",
                      style: TextStyle(
                        color: Color.fromARGB(255, 64, 64, 64),
                        fontSize: 18,
                        fontFamily: 'Mulish',
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: 0.01*height),

                GestureDetector(
                  child: const ListTile(
                    title: Text(
                      "History",
                      style: TextStyle(
                        color: Color.fromARGB(255, 64, 64, 64),
                        fontSize: 18,
                        fontFamily: 'Mulish',
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: 0.01*height),
                
                GestureDetector(
                  child: const ListTile(
                    title: Text(
                      "Help",
                      style: TextStyle(
                        color: Color.fromARGB(255, 64, 64, 64),
                        fontSize: 18,
                        fontFamily: 'Mulish',
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 0.01*height),

                GestureDetector(
                  child: const ListTile(
                    title: Text(
                      "About Us",
                      style: TextStyle(
                        color: Color.fromARGB(255, 64, 64, 64),
                        fontSize: 18,
                        fontFamily: 'Mulish',
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),

          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 0.02*height, 
                  right: 0.035*width
                ),
                child: Image.asset(
                "assets/sidebar/watermark.png",
                height: 50,
                width: 127,
                ),
              ),
            )
          )
        ],
      ) 
    );
  }
}