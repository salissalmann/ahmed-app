import 'package:flutter/material.dart';
import 'ResultPage3.dart';

class PositiveNegativePage extends StatefulWidget {
  const PositiveNegativePage({Key? key}) : super(key: key);

  @override
  State<PositiveNegativePage> createState() => _PositiveNegativePageState();
}

class _PositiveNegativePageState extends State<PositiveNegativePage> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. Interested',
      'options': [
        'Very',
        'Slightly or not at all',
        'A little',
        'Moderately',
        'Quite a bit',
        'Extremely'
      ],
    },
    {
      'question': '2. Distressed',
      'options': [
        'Very',
        'Slightly or not at all',
        'A little',
        'Moderately',
        'Quite a bit',
        'Extremely'
      ],
    },
    {
      'question': '3. Excited',
      'options': [
        'Very',
        'Slightly or not at all',
        'A little',
        'Moderately',
        'Quite a bit',
        'Extremely'
      ],
    },
    {
      'question': '4. Upset',
      'options': [
        'Very',
        'Slightly or not at all',
        'A little',
        'Moderately',
        'Quite a bit',
        'Extremely'
      ],
    },
    {
      'question': '5. Strong',
      'options': [
        'Very',
        'Slightly or not at all',
        'A little',
        'Moderately',
        'Quite a bit',
        'Extremely'
      ],
    },
    {
      'question': '6. Guilty',
      'options': [
        'Very',
        'Slightly or not at all',
        'A little',
        'Moderately',
        'Quite a bit',
        'Extremely'
      ],
    },
    {
      'question': '7. Scared',
      'options': [
        'Very',
        'Slightly or not at all',
        'A little',
        'Moderately',
        'Quite a bit',
        'Extremely'
      ],
    },
    {
      'question': '8. Hostile',
      'options': [
        'Very',
        'Slightly or not at all',
        'A little',
        'Moderately',
        'Quite a bit',
        'Extremely'
      ],
    },
    {
      'question': '9. Enthusiastic',
      'options': [
        'Very',
        'Slightly or not at all',
        'A little',
        'Moderately',
        'Quite a bit',
        'Extremely'
      ],
    },
    {
      'question': '10. Proud',
      'options': [
        'Very',
        'Slightly or not at all',
        'A little',
        'Moderately',
        'Quite a bit',
        'Extremely'
      ],
    },
    {
      'question': '11. Irritable',
      'options': [
        'Very',
        'Slightly or not at all',
        'A little',
        'Moderately',
        'Quite a bit',
        'Extremely'
      ],
    },
    {
      'question': '12. Alert',
      'options': [
        'Very',
        'Slightly or not at all',
        'A little',
        'Moderately',
        'Quite a bit',
        'Extremely'
      ],
    },
    {
      'question': '13. Ashamed',
      'options': [
        'Very',
        'Slightly or not at all',
        'A little',
        'Moderately',
        'Quite a bit',
        'Extremely'
      ],
    },
    {
      'question': '14. Inspired',
      'options': [
        'Very',
        'Slightly or not at all',
        'A little',
        'Moderately',
        'Quite a bit',
        'Extremely'
      ],
    },
    {
      'question': '15. Nervous',
      'options': [
        'Very',
        'Slightly or not at all',
        'A little',
        'Moderately',
        'Quite a bit',
        'Extremely'
      ],
    },
    {
      'question': '16. Determined',
      'options': [
        'Very',
        'Slightly or not at all',
        'A little',
        'Moderately',
        'Quite a bit',
        'Extremely'
      ],
    },
    {
      'question': '17. Attentive',
      'options': [
        'Very',
        'Slightly or not at all',
        'A little',
        'Moderately',
        'Quite a bit',
        'Extremely'
      ],
    },
    {
      'question': '18. Jittery',
      'options': [
        'Very',
        'Slightly or not at all',
        'A little',
        'Moderately',
        'Quite a bit',
        'Extremely'
      ],
    },
    {
      'question': '19. Active',
      'options': [
        'Very',
        'Slightly or not at all',
        'A little',
        'Moderately',
        'Quite a bit',
        'Extremely'
      ],
    },
    {
      'question': '20. Afraid',
      'options': [
        'Very',
        'Slightly or not at all',
        'A little',
        'Moderately',
        'Quite a bit',
        'Extremely'
      ],
    },
  ];

  List<int> _answers = List.filled(20, -1);

  int getScore() {
    return _answers.where((score) => score != -1).reduce((a, b) => a + b);
  }

  void navigateToResultPage() {
    if (_answers.contains(-1)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please answer all questions.'),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResultPage3(answers: _answers),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFecfdc598),
      appBar: AppBar(
        // title: const Text('Positive/Negative'),
        backgroundColor: const Color(0xFFecfdc598),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: questions.length + 1, // +1 for the submit button
                  itemBuilder: (BuildContext context, int index) {
                    if (index == questions.length) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
                        child: ElevatedButton(
                          onPressed: navigateToResultPage,
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: Color(0xFF249689)),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(const Color(0xFFB1D5DF)),
                          ),
                        ),
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              questions[index]['question'],
                              style: const TextStyle(
                                color: Color(0xFF249689),
                                fontSize: 18,
                                fontWeight: FontWeight.bold, // Make the question text bold
                              ),
                            ),
                          ),
                          ...questions[index]['options'].map<Widget>((option) {
                            int optionIndex = questions[index]['options'].indexOf(option);
                            return RadioListTile<int>(
                              title: Text(
                                option,
                                style: const TextStyle(color: Color(0xFF249689), fontSize: 18),
                              ),
                              value: optionIndex,
                              groupValue: _answers[index],
                              activeColor: const Color(0xFF249689),
                              onChanged: (int? value) {
                                setState(() {
                                  _answers[index] = value!;
                                });
                              },
                            );
                          }).toList(),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
