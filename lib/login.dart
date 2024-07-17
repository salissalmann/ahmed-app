import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';
import 'ForgotPassword.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    bool _isPasswordVisible = false;

    const Color backgroundColor = Color(0xFFecfdc598);
    const Color containerColor = Color(0xFFe6e6fa);
    const Color borderColor = Color(0xFF249689);
    const Color textColor = Color(0xFF249689);
    const Color buttonTextColor = Color(0xFF249689);
    const Color buttonBackgroundColor = Color(0xFFe6e6fa);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/image2.png',
                  height: 250,
                ),
                SizedBox(height: 30),
                const Text(
                  'Your Mental Health is Everything',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: borderColor,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        controller: emailController,
                        style: const TextStyle(
                          fontSize: 20,
                          color: textColor,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: textColor),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: textColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      StatefulBuilder(
                        builder: (context, setState) {
                          return TextField(
                            controller: passwordController,
                            obscureText: !_isPasswordVisible,
                            style: const TextStyle(
                              fontSize: 20,
                              color: textColor,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: const TextStyle(color: textColor),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: textColor,
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
                                  color: textColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPasswordWidget()),
                            );
                          },
                          child: const Text(
                            'Forgot password?',
                            textAlign:
                                TextAlign.right, // Align text to the right
                            style: TextStyle(
                              color: textColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );

                            // Save login state to shared preferences
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setBool('loggedIn', true);

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EpsychologistHomePage()),
                            );
                          } catch (e) {
                            print('Error signing in: $e');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Failed to sign in: ${e.toString()}')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonBackgroundColor,
                          foregroundColor: buttonTextColor,
                          textStyle: const TextStyle(fontSize: 20),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
