import 'package:flutter/material.dart';
import 'assessment/anxiety.dart'; 
import 'assessment/depression.dart';
import 'assessment/panicattacks.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assessment Tool',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AssessmentToolPage(),
    );
  }
}

class AssessmentToolPage extends StatelessWidget {
  const AssessmentToolPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFecfdc598),
      appBar: AppBar(
        title: Text(
          'Assessment Tool',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF249689),
          ),
        ),
        backgroundColor: const Color(0xFFecfdc598),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(flex: 2),
          const Text(
            'Click on the test you want to take to assess your mood',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30, // font size
              fontWeight: FontWeight.bold,
              color: Color(0xFF249689), 
            ),
          ),
          const Spacer(),
          ButtonWidget(
            title: 'Anxiety',
            onPressed: () => navigateTo(context, AnxietyPage()),
          ),
          ButtonWidget(
            title: 'Depression',
            onPressed: () => navigateTo(context, DepressionPage()),
          ),
          ButtonWidget(
  title: 'Positive & Negative Affect', 
  onPressed: () => navigateTo(context, const PositiveNegativePage()), // Navigate page
),

          const Spacer(flex: 2),
        ],
      ),
    );
  }

  void navigateTo(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ButtonWidget({Key? key, required this.title, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFe6e6fa),
          foregroundColor:const Color(0xFF249689)
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
