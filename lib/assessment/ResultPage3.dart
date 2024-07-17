import 'package:flutter/material.dart';

class ResultPage3 extends StatefulWidget {
  final List<int> answers;

  const ResultPage3({Key? key, required this.answers}) : super(key: key);

  @override
  State<ResultPage3> createState() => _ResultPage3State();
}

class _ResultPage3State extends State<ResultPage3> {
  late final int positiveAffectScore;
  late final int negativeAffectScore;
  late final String positivityLevel;
  late final IconData iconData;
  late final Color backgroundColor;
  late final String message;
  double containerSize = 0;

  @override
  void initState() {
    super.initState();
    positiveAffectScore = calculatePositiveAffectScore(widget.answers);
    negativeAffectScore = calculateNegativeAffectScore(widget.answers);
    positivityLevel = getPositivityLevel(positiveAffectScore, negativeAffectScore);
    iconData = getIconData(positiveAffectScore, negativeAffectScore);
    backgroundColor = getBackgroundColor(positiveAffectScore, negativeAffectScore);
    message = getMessage(positiveAffectScore, negativeAffectScore);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        containerSize = 1; // Start the animation once the widget is built
      });
    });
  }

  int calculatePositiveAffectScore(List<int> answers) {
    return answers[0] + answers[2] + answers[4] + answers[8] + answers[9] +
        answers[11] + answers[13] + answers[15] + answers[16] + answers[18];
  }

  int calculateNegativeAffectScore(List<int> answers) {
    return answers[1] + answers[3] + answers[5] + answers[6] + answers[7] +
        answers[10] + answers[12] + answers[14] + answers[17] + answers[19];
  }

  String getPositivityLevel(int positiveScore, int negativeScore) {
    if (positiveScore >= 30) {
      return 'High Positive Affect';
    } else if (negativeScore <= 30) {
      return 'Low Negative Affect';
    } else {
      return 'Balanced Affect';
    }
  }

  IconData getIconData(int positiveScore, int negativeScore) {
    if (positiveScore >= 30) {
      return Icons.sentiment_very_satisfied;
    } else if (negativeScore <= 30) {
      return Icons.sentiment_very_dissatisfied;
    } else {
      return Icons.sentiment_neutral;
    }
  }

  Color getBackgroundColor(int positiveScore, int negativeScore) {
    if (positiveScore >= 30) {
      return Colors.green;
    } else if (negativeScore <= 30) {
      return Colors.red;
    } else {
      return Colors.orange;
    }
  }

  String getMessage(int positiveScore, int negativeScore) {
    if (positiveScore >= 30) {
      return 'Your positive affect level is high. Keep up the positivity!';
    } else if (negativeScore <= 30) {
      return 'Your negative affect level is low. Great job!';
    } else {
      return 'Your positive and negative affect levels are balanced.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Affect Results'),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: Color(0xFFecfdc598), // Set the background color here
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              width: containerSize * MediaQuery.of(context).size.width * 0.7, // Animate width
              decoration: BoxDecoration(
                color: backgroundColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: backgroundColor.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(iconData, size: MediaQuery.of(context).size.width * 0.25, color: backgroundColor),
                  const SizedBox(height: 20),
                  Text(
                    positivityLevel,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06, fontWeight: FontWeight.bold, color: backgroundColor),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
