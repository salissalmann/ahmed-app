import 'package:flutter/material.dart';
import 'ResultPage.dart';

class AnxietyPage extends StatefulWidget {
  const AnxietyPage({Key? key}) : super(key: key);

  @override
  State<AnxietyPage> createState() => _AnxietyPageState();
}

class _AnxietyPageState extends State<AnxietyPage> {
  final List<Map<String, dynamic>> questions = [
    {
      'questionText': '1. Do you feel numb and does it bother you?',
      'answers': [
        'I do not feel numbness or tingling',
        'I mildly feel numbness or tingling but it doesn’t bother me much',
        'I moderately feel numbness or tingling and it wasn’t pleasant',
        'I severely feel numbness or tingling and it bothered me a lot.',
      ],
    },
    {
      'questionText': '2. Do you feel hot and does it bother you?',
      'answers': [
        'I do not experience feeling hot',
        'I mildly experience feeling hot but it doesn’t bother me much',
        'I moderately experience feeling hot and it wasn’t pleasant',
        'I severely experience feeling hot and it bothered me a lot',
      ],
    },
    {
      'questionText': '3. Are you able to relax? How do you feel about it?',
      'answers': [
        'I am able to relax',
        'I am mildly unable to relax but it doesn’t bother me much',
        'I am moderately unable to relax and it wasn’t pleasant at times',
        'I am severely unable to relax and it bothered me a lot',
      ],
    },
    {
      'questionText': '4. Do you have fear of anything that could possible happen? Does it bother you?',
      'answers': [
        'I do not have a fear of the worst happening',
        'I mildly have a fear of the worst happening but it doesn’t bother me much',
        'I moderately have a fear of the worst and it is not pleasant at times',
        'I severely have a fear of the worst and it bothers me a lot',
      ],
    },
    {
      'questionText': '5. Do you feel dizzy? Does it bother you?',
      'answers': [
        'I do not feel dizziness or lightheadedness',
        'I mildly feel dizziness or lightheadedness but it doesn’t bother me much',
        'I moderately feel dizziness or lightheadedness and it doesn’t feel pleasant at times',
        'I severely feel dizziness or lightheadedness and it bothers me a lot',
      ],
    },
    {
      'questionText': '6. Do you experience wobbliness in your legs? Does it bother you?',
      'answers': [
        'I do not feel wobbliness in legs',
        'I mildly experience wobbliness in legs but it doesn’t bother me much',
        'I moderately experience wobbliness in legs and it wasn’t pleasant at times',
        'I severely experience wobbliness in legs and it bothered me a lot',
      ],
    },
    {
      'questionText': '7. Does your heart race a lot? Does it bother you?',
      'answers': [
        'I do not feel my heart pounding/racing',
        'I mildly feel my heart pounding/racing but it doesn’t bother me much',
        'I moderately feel my heart pounding/racing and it doesn’t feel pleasant at times',
        'I severely feel my heart pounding/racing and it bothers me a lot',
      ],
    },
    {
      'questionText': '8. Do you feel unsteady? Does it bother you?',
      'answers': [
        'I do not feel unsteady',
        'I mildly feel unsteady but it doesn’t bother me much',
        'I moderately feel unsteady and it doesn’t feel pleasant at times',
        'I severely feel unsteady and it bothers me a lot',
      ],
    },
    {
      'questionText': '9. Do you feel terrified? Does it bother you?',
      'answers': [
        'I do not feel terrified or afraid',
        'I mildly feel terrified or afraid but it doesn’t bother me much',
        'I moderately feel terrified or afraid and it doesn’t feel pleasant at times',
        'I severely feel terrified or afraid and it bothers me a lot',
      ],
    },
    {
      'questionText': '10. Do you feel nervous? Does it bother you?',
      'answers': [
        'I do not feel nervous',
        'I mildly feel nervous but it doesn’t bother me much',
        'I moderately feel nervous and it doesn’t feel pleasant at times',
        'I severely feel nervous and it bothers me a lot',
      ],
    },
    {
      'questionText': '11. Do you feel like you are choking? Does it bother you?',
      'answers': [
        'I do not have a feeling of choking',
        'I mildly have a feeling of choking but it doesn’t bother me much',
        'I moderately have a feeling of choking and it doesn’t feel pleasant at times',
        'I severely have a feeling of choking and it bothers me a lot',
      ],
    },
    {
      'questionText': '12. Does your hands tremble? Does it bother you?',
      'answers': [
        'I do not experience hands trembling',
        'I mildly experience hands trembling but it doesn’t bother me much',
        'I moderately experience hands trembling and it doesn’t feel pleasant at times',
        'I severely experience hands trembling and it bothers me a lot',
      ],
    },
    {
      'questionText': '13. Do you feel like you are shaking unconsciously? Does it bother you?',
      'answers': [
        'I do not feel shaky/unsteady',
        'I mildly feel shaky/unsteady but it doesn’t bother me much',
        'I moderately feel shaky/unsteady and it doesn’t feel pleasant at times',
        'I severely feel shaky/unsteady and it bothers me a lot',
      ],
    },
    {
      'questionText': '14. Do you have any fear of losing control? Does it bother you?',
      'answers': [
        'I do not have a fear of losing control',
        'I mildly have a fear of losing control but it doesn’t bother me much',
        'I moderately have a fear of losing control and it doesn’t feel pleasant at times',
        'I severely have a fear of losing control and it bothers me a lot',
      ],
    },
    {
      'questionText': '15. Do you experience any difficulty in breathing? Does it bother you?',
      'answers': [
        'I do not have difficulty in breathing',
        'I mildly have difficulty in breathing but it doesn’t bother me much',
        'I moderately have difficulty in breathing and it doesn’t feel pleasant at times',
        'I severely have difficulty in breathing and it bothers me a lot',
      ],
    },
    {
      'questionText': '16. Do you have fear of dying? Does it bother you?',
      'answers': [
        'I do not have a fear of dying',
        'I mildly have a fear of dying but it doesn’t bother me much',
        'I moderately have a fear of dying and it doesn’t feel pleasant at times',
        'I severely have a fear of dying and it bothers me a lot',
      ],
    },
    {
      'questionText': '17. Do you feel scared? Does it bother you?',
      'answers': [
        'I do not feel scared',
        'I mildly feel scared but it doesn’t bother me much',
        'I moderately feel scared and it doesn’t feel pleasant at times',
        'I severely feel scared and it bothers me a lot',
      ],
    },
    {
      'questionText': '18. Do you experience indigestion? Does it bother you?',
      'answers': [
        'I do not experience indigestion',
        'I mildly experience indigestion but it doesn’t bother me much',
        'I moderately experience indigestion and it doesn’t feel pleasant at times',
        'I severely experience indigestion and it bothers me a lot',
      ],
    },
    {
      'questionText': '19. Do you faint frequently or feel lightheaded? Does it bother you?',
      'answers': [
        'I do not feel faint/lightheaded',
        'I mildly feel faint/lightheaded but it doesn’t bother me much',
        'I moderately feel faint/lightheaded and it doesn’t feel pleasant at times',
        'I severely feel faint/lightheaded and it bothers me a lot',
      ],
    },
    {
      'questionText': '20. Do you have extreme hot/cold sweat that is more than usual? Does it bother you?',
      'answers': [
        'I do not have hot/cold sweats',
        'I mildly have hot/cold sweats but it doesn’t bother me much',
        'I moderately have hot/cold sweats and it doesn’t feel pleasant at times',
        'I severely have hot/cold sweats and it bothers me a lot',
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
      final score = getScore();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResultPage(score: score),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFecfdc598),
      appBar: AppBar(
       // title: const Text('Anxiety'),
        backgroundColor: const Color(0xFFecfdc598),
        iconTheme: const IconThemeData(color: Color(0xFF249689)),
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
                          backgroundColor: MaterialStateProperty.all(const Color(0xFFe6e6fa)),
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
                              fontWeight: FontWeight.bold,
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
