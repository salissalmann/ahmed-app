import 'package:flutter/material.dart';

class NosebleedsPage extends StatelessWidget {
  const NosebleedsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFecfdc598), // Background color of the page
      appBar: AppBar(
        backgroundColor: const Color(0xFFecfdc598),
        title: Text(
          'NoseBleeds',
          style: TextStyle(color: Color(0xFF249689)),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF249689)),
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
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'WHAT TO DO?\n',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const TextSpan(
                  text: '1) Lean slightly forward, not back.\n'
                      '2) Pinch your nose just below the bridge. It needs to be high enough that the nostrils are not pinched closed.\n'
                      '3) After five minutes, check to see if the bleeding has stopped. If not, continue pinching and check after another 10 minutes.\n'
                      '4) Apply a cold pack to the bridge of your nose while you’re pinching.\n\n',
                  style: TextStyle(fontSize: 16),
                ),
                TextSpan(
                  text: 'Call your provider if:\n',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const TextSpan(
                  text: '1) You get frequent nosebleeds.\n'
                      '2) You have anemia symptoms (e.g., weakness, faintness, fatigue, and pale skin).\n'
                      '3) You’re taking blood thinners.\n'
                      '4) You have a clotting or bleeding disorder.\n'
                      '5) You just started a new medication.\n'
                      '6) You also have unusual bruising.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
              style: TextStyle(color: Color(0xFF249689)), // Text color
            ),
          ),
        ),
      ),
    );
  }
}
