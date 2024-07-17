import 'package:epsychologist/terms_and_conditions.dart'; // Import the terms and conditions screen
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:epsychologist/main.dart'; // Import the welcome page

class CreateWidget extends StatefulWidget {
  const CreateWidget({Key? key}) : super(key: key);

  static String id = 'signup_screen';

  @override
  _CreateWidgetState createState() => _CreateWidgetState();
}

class _CreateWidgetState extends State<CreateWidget> {
  bool _isPasswordVisible = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFecfdc598),
      body: SafeArea(
        child: Stack(
          children: [
            // Background circles
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
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.85,
                decoration: BoxDecoration(
                  color: Color(0xFFe6e6fa), // Background color added here
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Color(0xFF249689),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Create an account',
                        style: TextStyle(
                          color: Color(0xFF249689),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: nameController,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF249689),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(color: Color(0xFF249689)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xFF249689),
                          ),
                        ),
                      ),
                      TextField(
                        controller: emailController,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF249689),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Color(0xFF249689)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xFF249689),
                          ),
                        ),
                      ),
                      TextField(
                        controller: contactController,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF249689),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Contact no',
                          hintStyle: TextStyle(color: Color(0xFF249689)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color(0xFF249689),
                          ),
                        ),
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: !_isPasswordVisible,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF249689),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Color(0xFF249689)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xFF249689),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Color(0xFF249689),
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        controller: confirmPasswordController,
                        obscureText: !_isPasswordVisible,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF249689),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(color: Color(0xFF249689)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xFF249689),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Color(0xFF249689),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (passwordController.text ==
                              confirmPasswordController.text) {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TermsAndConditionsWidget(),
                              ),
                            );

                            if (result == true) {
                              try {
                                UserCredential userCredential = await FirebaseAuth
                                    .instance
                                    .createUserWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );

                                // Send email verification
                                User? user = userCredential.user;
                                if (user != null && !user.emailVerified) {
                                  await user.sendEmailVerification();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Verification email has been sent. Please check your email.')),
                                  );
                                }

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WelcomeWidget(),
                                  ),
                                );
                              } catch (e) {
                                print('Error creating user: $e');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Failed to create account: ${e.toString()}')),
                                );
                              }
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Passwords do not match')),
                            );
                          }
                        },
                        child: Text('Create an account'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF249689),
                          foregroundColor: Color(0xFFecfdc598),
                          textStyle: TextStyle(fontSize: 20),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
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
