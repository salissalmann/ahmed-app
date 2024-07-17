import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';
import 'user.dart';
import 'about.dart'; // Import the AboutPage

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: Color(0xFF249689)),
        ),
        backgroundColor: Color(0xFFe6e6fa),
        iconTheme: IconThemeData(color: Color(0xFF249689)),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('User Account Management',
                  style: TextStyle(color: Color(0xFF249689))),
              leading: Icon(Icons.account_circle, color: Color(0xFF249689)),
              onTap: () {
                try {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            UserPage()), // Navigate to UserPage
                  );
                } catch (e) {
                  print('Error navigating to UserPage: $e');
                }
              },
            ),
            ListTile(
              title: Text('Delete Account',
                  style: TextStyle(color: Color(0xFF249689))),
              leading: Icon(Icons.delete, color: Color(0xFF249689)),
              onTap: () async {
                try {
                  // Get the currently logged-in user
                  User? user = FirebaseAuth.instance.currentUser;

                  // Prompt the user to confirm account deletion
                  bool confirmDelete = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Delete Account?',
                            style: TextStyle(color: Color(0xFF249689))),
                        content: Text(
                            'Are you sure you want to delete your account? This action cannot be undone.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context,
                                  false); // Return false if user cancels
                            },
                            child: Text('Cancel',
                                style: TextStyle(color: Color(0xFF249689))),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context,
                                  true); // Return true if user confirms
                            },
                            child: Text('Delete',
                                style: TextStyle(color: Color(0xFF249689))),
                          ),
                        ],
                      );
                    },
                  );

                  // If user confirms deletion, delete the account
                  if (confirmDelete == true) {
                    await user?.delete();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WelcomeWidget()), // Navigate to WelcomeWidget after deletion
                    );
                  }
                } catch (e) {
                  print('Error deleting account: $e');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('Failed to delete account: ${e.toString()}')),
                  );
                }
              },
            ),
            ListTile(
              title: Text('Logout', style: TextStyle(color: Color(0xFF249689))),
              leading: Icon(Icons.logout, color: Color(0xFF249689)),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          WelcomeWidget()), // Navigate to WelcomeWidget
                );
              },
            ),
            ListTile(
              title: Text('About', style: TextStyle(color: Color(0xFF249689))),
              leading: Icon(Icons.info, color: Color(0xFF249689)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AboutPage()), // Navigate to AboutPage
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFe6e6fa),
    );
  }
}
