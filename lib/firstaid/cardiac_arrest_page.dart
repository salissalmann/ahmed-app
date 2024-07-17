import 'package:flutter/material.dart';

class CardiacArrestPage extends StatelessWidget {
  const CardiacArrestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFecfdc598), // Set background color
      appBar: AppBar(
        backgroundColor: const Color(0xFFecfdc598), // AppBar color
        title: Text(
          'Cardiac Arrest',
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
            color: const Color(0xFFe6e6fa), // Box color
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          child: Text(
            'WHAT TO DO?\n\n'
            'Start doing chest compressions on the person who needs help. Using both your hands, push down hard and fast in the center of the person’s chest. Let their chest come back up naturally between compressions. You may hear pops or snaps; this is normal.\n\n'
            'Keep going until someone with more training arrives.\n\n'
            'If you’re trained in CPR, you can use chest compressions and rescue breathing.',
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
