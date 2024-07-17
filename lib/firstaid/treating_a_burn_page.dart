import 'package:flutter/material.dart';

class TreatingABurnPage extends StatelessWidget {
  const TreatingABurnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFecfdc598), // Background color of the page
      appBar: AppBar(
        backgroundColor: const Color(0xFFecfdc598),
        title: Text(
          'Treating a Burn',
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
            'For burns that are not an emergency, you can take these first aid steps:\n\n'
            'Flush the burned area with cool running water for several minutes. Do not use ice.\n'
            'Apply a light gauze bandage. If the burn is minor, you can put on an ointment, like aloe vera, before you cover it.\n\n'
            'Take Motrin (ibuprofen) or Tylenol (acetaminophen) for pain relief if you need it.\n\n'
            'Do not break any blisters that form.',
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
