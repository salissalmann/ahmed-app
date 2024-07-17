import 'package:flutter/material.dart';
import 'ResultPage2.dart';

class DepressionPage extends StatefulWidget {
  const DepressionPage({Key? key}) : super(key: key);

  @override
  State<DepressionPage> createState() => _DepressionPageState();
}

class _DepressionPageState extends State<DepressionPage> {
  final List<Map<String, dynamic>> questions = [
    {
      'questionText': '1. Are you sad?',
      'answers': [
        'I do not feel sad.',
        'I feel sad',
        'I am sad all the time and I can\'t snap out of it.',
        'I am so sad and unhappy that I can\'t stand it.',
      ],
    },
    {
      'questionText': '2. What are your future plans or goals?',
      'answers': [
        'I am not particularly discouraged about the future.',
        'I feel discouraged about the future.',
        'I feel I have nothing to look forward to.',
        'I feel the future is hopeless and that things cannot improve.',
      ],
    },
    {
      'questionText': '3. Do you think of yourself as a failure?',
      'answers': [
        'I do not feel like a failure.',
        'I feel I have failed more than the average person.',
        'As I look back on my life, all I can see is a lot of failures.',
        'I feel I am a complete failure as a person.',
      ],
    },
    {
      'questionText': '4. Do you enjoy things as much as before?',
      'answers': [
        'I get as much satisfaction out of things as I used to.',
        'I don\'t enjoy things the way I used to.',
        'I don\'t get real satisfaction out of anything anymore.',
        'I am dissatisfied or bored with everything.',
      ],
    },
    {
      'questionText': '5. Is there anything you feel guilty about?',
      'answers': [
        'I don\'t feel particularly guilty.',
        'I feel guilty a good part of the time.',
        'I feel quite guilty most of the time.',
        'I feel guilty all of the time.',
      ],
    },
    {
      'questionText': '6. Do you feel like you are being punished for anything?',
      'answers': [
        'I don\'t feel I am being punished.',
        'I feel I may be punished.',
        'I expect to be punished.',
        'I feel I am being punished.',
      ],
    },
    {
      'questionText': '7. Do you feel disappointed in yourself?',
      'answers': [
        'I don\'t feel disappointed in myself.',
        'I am disappointed in myself.',
        'I am disgusted with myself.',
        'I hate myself.',
      ],
    },
    {
      'questionText': '8. Do you blame yourself all the time?',
      'answers': [
        'I don\'t feel I am any worse than anybody else.',
        'I am critical of myself for my weaknesses or mistakes.',
        'I blame myself all the time for my faults.',
        'I blame myself for everything bad that happens.',
      ],
    },
    {
      'questionText': '9. Do you feel like taking your life?',
      'answers': [
        'I don\'t have any thoughts of killing myself.',
        'I have thoughts of killing myself, but I would not carry them out.',
        'I would like to kill myself.',
        'I would kill myself if I had the chance.',
      ],
    },
    {
      'questionText': '10. Do you cry often?',
      'answers': [
        'I don\'t cry any more than usual.',
        'I cry more now than I used to.',
        'I cry all the time now.',
        'I used to be able to cry, but now I can\'t cry even though I want to.',
      ],
    },
    {
      'questionText': '11. Do you find yourself irritated with things around you?',
      'answers': [
        'I am no more irritated by things than I ever was.',
        'I am slightly more irritated now than usual.',
        'I am quite annoyed or irritated a good deal of the time.',
        'I feel irritated all the time.',
      ],
    },
    {
      'questionText': '12. Have you lost your interest in other people around you?',
      'answers': [
        'I have not lost interest in other people.',
        'I am less interested in other people than I used to be.',
        'I have lost most of my interest in other people.',
        'I have lost all of my interest in other people.',
      ],
    },
    {
      'questionText': '13. Do you think you are indecisive and find it difficult to make any decision?',
      'answers': [
        'I make decisions about as well as I ever could.',
        'I put off making decisions more than I used to.',
        'I have greater difficulty in making decisions more than I used to.',
        'I can\'t make decisions at all anymore.',
      ],
    },
    {
      'questionText': '14. How do you feel about your appearance?',
      'answers': [
        'I don\'t feel that I look any worse than I used to.',
        'I am worried that I am looking old or unattractive.',
        'I feel there are permanent changes in my appearance that make me look unattractive.',
        'I believe that I look ugly.',
      ],
    },
    {
      'questionText': '15. Do you feel any difference in the way you work?',
      'answers': [
        'I can work about as well as before.',
        'It takes an extra effort to get started at doing something.',
        'I have to push myself very hard to do anything.',
        'I can\'t do any work at all.',
      ],
    },
    {
      'questionText': '16. What is your sleep schedule?',
      'answers': [
        'I can sleep as well as usual.',
        'I don\'t sleep as well as I used to.',
        'I wake up 1-2 hours earlier than usual and find it hard to get back to sleep.',
        'I wake up several hours earlier than I used to and cannot get back to sleep.',
      ],
    },
    {
      'questionText': '17. Do you get tired often?',
      'answers': [
        'I don\'t get more tired than usual.',
        'I get tired more easily than I used to.',
        'I get tired from doing almost anything.',
        'I am too tired to do anything.',
      ],
    },
    {
      'questionText': '18. How is your appetite?',
      'answers': [
        'My appetite is no worse than usual.',
        'My appetite is not as good as it used to be.',
        'My appetite is much worse now.',
        'I have no appetite at all anymore.',
      ],
    },
    {
      'questionText': '19. Do you think you have lost any weight recently? If yes then how much?',
      'answers': [
        'I haven\'t lost much weight, if any, lately.',
        'I have lost more than five pounds.',
        'I have lost more than ten pounds.',
        'I have lost more than fifteen pounds.',
      ],
    },
    {
      'questionText': '20. Are you having physical health issues?',
      'answers': [
        'I am no more worried about my health than usual.',
        'I am worried about physical problems like aches, pains, upset stomach, or constipation.',
        'I am very worried about physical problems and it\'s hard to think of much else.',
        'I am so worried about my physical problems that I cannot think of anything else.',
      ],
    },
  ];

  List<int> _answers = List.filled(20, -1); // Adjust the size based on your number of questions

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
      final score = getScore();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResultPage2(score: score),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFecfdc598),
      appBar: AppBar(
        // title: const Text('Depression'),
        backgroundColor: const Color(0xFFecfdc598),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    // This is a question item
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            questions[index]['questionText'],
                            style: const TextStyle(
                              color: Color(0xFF249689),
                              fontSize: 18,
                              fontWeight: FontWeight.bold, // Make the question text bold
                            ),
                          ),
                        ),
                        ...questions[index]['answers'].map<Widget>((answer) {
                          int answerIndex = questions[index]['answers'].indexOf(answer);
                          return RadioListTile<int>(
                            title: Text(
                              answer,
                              style: const TextStyle(color: Color(0xFF249689)),
                            ),
                            value: answerIndex,
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
        ),
      ),
    );
  }
}
