import 'package:flutter/material.dart';
import 'healthandfitness/running.dart';
import 'healthandfitness/boxbreathing.dart';
import 'healthandfitness/yoga.dart';
import 'healthandfitness/swimming.dart';

class HealthfitnessWidget extends StatefulWidget {
  const HealthfitnessWidget({super.key});

  @override
  State<HealthfitnessWidget> createState() => _HealthfitnessWidgetState();
}

class _HealthfitnessWidgetState extends State<HealthfitnessWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Health and Fitness Tips'),
        backgroundColor: Color(0xFFecfdc598),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Color(0xFFecfdc598),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Health and Fitness Tips',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF249689),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/images/tips.png', // Make sure the path matches your asset location
                width: 100,
                height: 100,
                color: Colors.teal, // Optional: to color the image
                colorBlendMode:
                    BlendMode.color, // Optional: blend mode to apply the color
              ),
            ),
            SizedBox(height: 20),
            buildFitnessOption(
              context,
              icon: Icons.directions_run,
              label: 'Running',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RunningHealth()),
                );
              },
            ),
            buildFitnessOption(
              context,
              icon: Icons.self_improvement,
              label: 'Box Breathing',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BoxBreathing()),
                );
              },
            ),
            buildFitnessOption(
              context,
              icon: Icons.spa,
              label: 'Yoga',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YogaHealth()),
                );
              },
            ),
            buildFitnessOption(
              context,
              icon: Icons.pool,
              label: 'Swimming',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SwimmingHealth()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFitnessOption(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
            color: Color(0xFFB1D5DF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  icon,
                  size: 35,
                  color: Color(0xFF545454),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF545454),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
