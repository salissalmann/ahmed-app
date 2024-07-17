import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _usernameController.text = _auth.currentUser?.displayName ?? '';
  }

  void _updatePassword() async {
    try {
      await _auth.currentUser?.updatePassword(_passwordController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password updated successfully')),
      );
      _passwordController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update password: $e')),
      );
    }
  }

  void _updateUsername() async {
    try {
      await _auth.currentUser?.updateDisplayName(_usernameController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username updated successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update username: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('User Account Management'),
        backgroundColor: const Color(0xFFecfdc598),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Update your account information below:',
              style: TextStyle(
                color: Color(0xFF249689),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Update Password',
                labelStyle: TextStyle(color: Color(0xFF249689)),
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _updatePassword,
              child: const Text('Update Password'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF249689),
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Update Username',
                labelStyle: TextStyle(color: Color(0xFF249689)),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _updateUsername,
              child: const Text('Update Username'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF249689),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFecfdc598),
    );
  }
}
