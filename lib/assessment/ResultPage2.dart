import 'package:flutter/material.dart';

class ResultPage2 extends StatefulWidget {
  final int score;

  const ResultPage2({Key? key, required this.score}) : super(key: key);

  @override
  State<ResultPage2> createState() => _ResultPage2State();
}

class _ResultPage2State extends State<ResultPage2> {
  late final String depressionLevel;
  late final IconData iconData;
  late final Color backgroundColor;
  late final String message;
  double containerSize = 0;

  @override
  void initState() {
    super.initState();
    depressionLevel = getDepressionLevel(widget.score);
    iconData = getIconData(widget.score);
    backgroundColor = getBackgroundColor(widget.score);
    message = getMessage(widget.score);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        containerSize = 1; // Start the animation once the widget is built
      });
    });
  }

  String getDepressionLevel(int score) {
    if (score >= 41) {
      return 'Extreme depression';
    } else if (score >= 31 && score <= 40) {
      return 'Severe depression';
    } else if (score >= 21 && score <= 30) {
      return 'Moderate depression';
    } else if (score >= 17 && score <= 20) {
      return 'Borderline clinical depression';
    } else if (score >= 11 && score <= 16) {
      return 'Mild mood disturbance';
    } else {
      return 'These ups and downs are considered normal';
    }
  }

 IconData getIconData(int score) {
    if (score >= 41) {
      return Icons.sentiment_very_dissatisfied;
    } else if (score >= 31) {
      return Icons.sentiment_dissatisfied;
    } else if (score >= 21) {
      return Icons.sentiment_neutral;
    } else if (score >= 17) {
      return Icons.sentiment_satisfied;
    } else if (score >= 11) {
      return Icons.sentiment_satisfied_alt;
    } else {
      return Icons.sentiment_very_satisfied;
    }
  }


  Color getBackgroundColor(int score) {
    if (score >= 41) {
      return Colors.redAccent;
    } else if (score >= 31) {
      return Colors.red;
    } else if (score >= 21) {
      return Colors.orange;
    } else if (score >= 17) {
      return Colors.lightBlue;
    } else if (score >= 11) {
      return Colors.blue;
    } else {
      return Colors.green;
    }
  }

  String getMessage(int score) {
    if (score >= 41) {
      return 'We encourage seeking support from a healthcare professional.';
    } else if (score >= 31) {
      return 'Consider discussing your feelings with someone you trust.';
    } else if (score >= 21) {
      return 'Small steps towards self-care can be really beneficial.';
    } else if (score >= 17) {
      return 'You might find mindfulness or relaxation techniques helpful.';
    } else if (score >= 11) {
      return 'Regular physical activity can positively affect your mood.';
    } else {
      return 'Maintaining a balanced lifestyle supports mental well-being.';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Depression Results'),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: Color(0xFFecfdc598), // Set the background color here
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          width: containerSize * MediaQuery.of(context).size.width * 0.5, // Animate width
          height: containerSize * MediaQuery.of(context).size.height * 0.4, // Animate height
          decoration: BoxDecoration(
            color: backgroundColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: backgroundColor.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(iconData, size: 120, color: backgroundColor),
                const SizedBox(height: 20),
                Text(
                  depressionLevel,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: backgroundColor),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
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
