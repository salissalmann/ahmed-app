import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'createaccount.dart';
import 'homepage.dart'; // Import your home page here

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDQ-1jK-SR91mrHe85hbiURK2Fdtm3lroE",
        authDomain: "e-psychologist-6db57.firebaseapp.com",
        projectId: "e-psychologist-6db57",
        storageBucket: "e-psychologist-6db57.appspot.com",
        messagingSenderId: "828409462960",
        appId: "1:828409462960:web:bd0fa502c1a7975b7bfb75",
        measurementId: "G-L0FFLD9GN1",
      ),
    );
  } else {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDQ-1jK-SR91mrHe85hbiURK2Fdtm3lroE",
        authDomain: "e-psychologist-6db57.firebaseapp.com",
        projectId: "e-psychologist-6db57",
        storageBucket: "e-psychologist-6db57.appspot.com",
        messagingSenderId: "828409462960",
        appId: "1:828409462960:web:bd0fa502c1a7975b7bfb75",
        measurementId: "G-L0FFLD9GN1",
      ),
    );
  }

  // Check if user is already logged in
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool loggedIn = prefs.getBool('loggedIn') ?? false;

  runApp(MaterialApp(
    title: 'Welcome Page',
    home: loggedIn ? EpsychologistHomePage() : WelcomeWidget(),
  ));
}

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFecfdc598),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: screenHeight * 0.2,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/welcome.png',
                    width: screenWidth * 0.60,
                    height: screenWidth * 0.60,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'WELCOME',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      color: Color(0xFF249689),
                      fontSize: screenWidth * 0.08,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        HoverButton(
                          text: 'Create an account',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreateWidget(),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 20.0),
                        HoverButton(
                          text: 'Already have an account',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginWidget(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -20,
              left: -50,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFFe6e6fa),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: -15,
              right: -50,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFFe6e6fa),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HoverButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const HoverButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 1.0, end: _isHovered ? 1.1 : 1.0),
      duration: Duration(milliseconds: 300),
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: ElevatedButton(
              onPressed: widget.onPressed,
              style: ElevatedButton.styleFrom(
                foregroundColor: Color(0xFFe6e6fa),
                backgroundColor: Color(0xFFe6e6fa),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                shadowColor: Colors.black45,
                //     backgroundColor: Colors.transparent,
              ),
              child: Container(
                constraints: BoxConstraints(minWidth: 50, minHeight: 20),
                alignment: Alignment.center,
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    color: Color(0xFF249689),
                    fontSize: screenWidth * 0.06,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
