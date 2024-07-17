import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:permission_handler/permission_handler.dart';
import 'dart:convert';
import 'assessment_tool.dart';
import 'medication.dart';
import 'firstaid.dart';
import 'setting.dart';
import 'Healthandfitness.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-psychologist',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: Colors.deepPurple[700]!,
          onPrimary: Colors.white,
          secondary: Colors.deepPurple[600]!,
          onSecondary: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.deepPurple[600]!,
          hintStyle: TextStyle(color: Colors.white54),
        ),
      ),
      home: EpsychologistHomePage(),
    );
  }
}

class EpsychologistHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Color(0xFF249689),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconButton(
                  icon: Icons.medication,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MedicationPage()),
                    );
                  },
                ),
                _buildIconButton(
                  icon: Icons.local_hospital,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirstAidPage()),
                    );
                  },
                ),
                _buildIconButton(
                  icon: Icons.assessment,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssessmentToolPage()),
                    );
                  },
                ),
                _buildIconButton(
                  icon: Icons.fitness_center,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HealthfitnessWidget()),
                    );
                  },
                ),
                _buildIconButton(
                  icon: Icons.account_circle,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFbaffb480), // Transition point 0.0
                    Color(0xFFbaffb480), // Transition point 0.2
                    Color(0xFF7EE1D4), // Transition point 0.75
                    Color(0xFF7EE1D4), // Transition point 1.0
                  ],
                  stops: [
                    0.0, // Start
                    0.2, // Transition point 0.2
                    0.85, // Transition point 0.55
                    1.0, // End
                  ],
                ),
              ),
              child: ChatScreen(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(
      {required IconData icon, required VoidCallback onPressed}) {
    return IconButton(
      icon: Icon(icon, size: 40, color: Color(0xFF8DDEED)),
      onPressed: onPressed,
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> messages = [];
  final List<Map<String, String>> conversationHistory = [];
  TextEditingController _textController = TextEditingController();
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _addWelcomeMessage();
  }

  void _addWelcomeMessage() {
    setState(() {
      messages.add({
        'role': 'e-psychologist',
        'content': 'Hello, your e-psychologist is here to help you.'
      });
      conversationHistory.add({
        'role': 'assistant',
        'content': 'Hello, your e-psychologist is here to help you.'
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            reverse: false,
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              final message = messages[index];
              bool isUserMessage = message['role'] == 'user';
              return Align(
                alignment: isUserMessage
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: isUserMessage
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      decoration: BoxDecoration(
                        color: isUserMessage
                            ? const Color.fromARGB(255, 157, 152, 166)
                            : Color.fromARGB(255, 145, 142, 152),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        message['content'],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    if (!isUserMessage) // e-psychologist label for bot messages
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, bottom: 2.0),
                        child: Text(
                          "e-psychologist",
                          style: TextStyle(
                              color: Color.fromARGB(255, 174, 173, 177), fontSize: 12),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Type here....',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 48, 47, 47),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  style: TextStyle(color: Color.fromARGB(255, 48, 47, 47)),
                ),
              ),
              IconButton(
                icon: Icon(_isListening ? Icons.mic_off : Icons.mic,
                    color: Color.fromARGB(255, 255, 255, 255), size: 24.0),
                onPressed: _listen,
              ),
              IconButton(
                icon: Icon(Icons.send, color: Color(0xFFFFFFFF), size: 24.0),
                onPressed: () {
                  _sendMessage(_textController.text);
                  _textController.clear();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _listen() async {
    if (!_isListening) {
      await _requestPermission(); // Request microphone permission
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  Future<void> _requestPermission() async {
    PermissionStatus permissionStatus = await Permission.microphone.request();
    if (permissionStatus == PermissionStatus.granted) {
      // Permission granted, continue with speech recognition initialization
      bool available = await _speech.initialize();
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(onResult: (result) {
          setState(() {
            _textController.text = result.recognizedWords;
          });
        });
      }
    } else {
      // Permission denied, handle accordingly
      print('Permission denied for speech recognition');
    }
  }

  Future<void> _sendMessage(String message) async {
    if (message.isEmpty) {
      // Show an error message if the message is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Message cannot be empty')),
      );
      return;
    }

    setState(() {
      messages.add({'role': 'user', 'content': message});
      conversationHistory.add({'role': 'user', 'content': message});
    });

    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer sk-proj-VPweT7AtZxI76NGCZXrCT3BlbkFJ5Q8QkTDxCT459JqIb7cz',
        },
        body: jsonEncode({
          'model': 'ft:gpt-3.5-turbo-0613:personal::9XR79SX8',
          'messages': conversationHistory
              .map((m) => {'role': m['role'], 'content': m['content']})
              .toList(),
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final String botResponse =
            responseData['choices'][0]['message']['content'].trim();

        setState(() {
          messages.add({'role': 'e-psychologist', 'content': botResponse});
          conversationHistory
              .add({'role': 'assistant', 'content': botResponse});
        });
      } else {
        _showErrorMessage('Failed to get response: ${response.statusCode}');
      }
    } catch (e) {
      _showErrorMessage(
          'Failed to connect to the server. Please try again later.');
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
