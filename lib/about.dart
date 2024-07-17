import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
          style: TextStyle(color: Color(0xFF249689)),
        ),
        backgroundColor: Color(0xFFecfdc598),
        iconTheme: IconThemeData(color: Color(0xFF249689)),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About This App',
              style: TextStyle(
                color: Color(0xFF249689),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'E-Psychologist is here to help its users. E-Psychologist has a chatbot that will chat with its users as a psychologist and give them the required therapy. E-Psychologist is available to its users 24/7 as long as the users have an internet connection and are logged into their account.',
              style: TextStyle(color: Color(0xFF249689)),
            ),
            SizedBox(height: 16),
            Text(
              'However, it is important to note that the effectiveness of a chatbot therapist can vary and its existence should be considered to provide ease to its users in many ways, rather than a replacement for traditional mental health services.',
              style: TextStyle(color: Color(0xFF249689)),
            ),
            SizedBox(height: 16),
            Text(
              'Version 1.0.0',
              style: TextStyle(color: Color(0xFF249689)),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFecfdc598),
    );
  }
}
