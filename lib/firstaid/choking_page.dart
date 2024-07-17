import 'package:flutter/material.dart';

class ChokingPage extends StatelessWidget {
  const ChokingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFecfdc598), // Background color of the page
      appBar: AppBar(
        backgroundColor: const Color(0xFFecfdc598),
        title: Text(
          'Choking',
          style: TextStyle(color: Color(0xFF249689)),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color:Color(0xFF249689)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(0xFFe6e6fa), // Color of the box
            borderRadius: BorderRadius.circular(12), // Rounded corners for the box
          ),
          child: Text(
            'WHAT TO DO?\n\n'
            '1) Stand behind the person & lean them slightly forward.\n'
            '2) Put your arms around their waist.\n'
            '3) Clench your fist and place it between their belly button (navel) and rib cage.\n'
            '4) Grab your fist with your other hand.\n'
            '5) Pull your clenched fist sharply backward and upward under the person’s rib cage in five quick thrusts.\n'
            '6) Repeat until the object is coughed up.',
            style: const TextStyle(
              color: Color(0xFF249689), // Text color
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
