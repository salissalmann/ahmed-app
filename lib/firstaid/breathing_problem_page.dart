import 'package:flutter/material.dart';

class BreathingProblemPage extends StatelessWidget {
  const BreathingProblemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFecfdc598), // Background color of the page
      appBar: AppBar(
        backgroundColor: const Color(0xFFecfdc598),
        
       title: Text(
          'Breathing Problem',
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
          margin: const EdgeInsets.all(16.0), // Ensures the box is centered and has space around it
          decoration: BoxDecoration(
            color: const Color(0xFFe6e6fa), // Color of the box
            borderRadius: BorderRadius.circular(12), // Rounded corners for the box
          ),
          child: Text(
            'WHAT TO DO?\n\n'
            'Airway: If someone’s not breathing, the first thing you need to do is clear their airway. If they’re still not breathing, provide rescue breathing.\n\n'
            'Breathing: If you have cleared a person’s airway but they’re still not breathing, provide rescue breathing.\n\n'
            'Circulation: As you are doing rescue breathing, perform chest compressions to keep the person’s blood circulating. If the person is breathing but is not responsive, check their pulse. If their heart has stopped, provide chest compressions.',
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
