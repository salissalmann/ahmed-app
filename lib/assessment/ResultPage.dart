import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final int score;

  const ResultPage({Key? key, required this.score}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late final String depressionLevel;
  late final IconData iconData;
  late final Color backgroundColor;
  late final String message;
  double containerSize = 0;

  @override
  void initState() {
    super.initState();
    depressionLevel = getAnxietyLevel(widget.score);
    iconData = getIconData(widget.score);
    backgroundColor = getBackgroundColor(widget.score);
    message = getMessage(widget.score);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        containerSize = 1; // Start the animation once the widget is built
      });
    });
  }


  String getAnxietyLevel(int score) {
    if (score >= 36) {
      return 'High anxiety';
    } else if (score >= 22 && score <= 35) {
      return 'Moderate anxiety';
    } else {
      return 'Low anxiety';
    }
  }

  IconData getIconData(int score) {
    if (score >= 36) {
      return Icons.sentiment_very_dissatisfied;
    } else if (score >= 22 && score <= 35) {
      return Icons.sentiment_dissatisfied;
    } else {
      return Icons.sentiment_satisfied;
    }
  }

  Color getBackgroundColor(int score) {
    if (score >= 36) {
      return Colors.red;
    } else if (score >= 22 && score <= 35) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  String getMessage(int score) {
    if (score >= 36) {
      return 'Seeking professional help is recommended.';
    } else if (score >= 22 && score <= 35) {
      return 'Consider talking to someone about your concerns.';
    } else {
      return 'Keep up the good work!';
    }
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Anxiety Results'),
      backgroundColor: backgroundColor,
    ),
    backgroundColor: Color(0xFFecfdc598), 
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