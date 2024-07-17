import 'package:flutter/material.dart';

class HeatstrokePage extends StatelessWidget {
  const HeatstrokePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFecfdc598), // Background color of the page
      appBar: AppBar(
        backgroundColor: const Color(0xFFecfdc598),
        title: Text(
          'HeatStroke',
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
            color: const Color(0xFFe6e6fa),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'WHAT TO DO?\n\n'
            'If someone is overheated, encourage them to rest in a cool location. Remove excess layers of clothing and try to cool their body down by doing the following:\n'
            '1) Cover them with a cool, damp sheet.\n'
            '2) Apply a cool, wet towel to the back of their neck.\n'
            '3) Sponge them with cool water.\n\n'
            'Call 911 if they develop signs or symptoms of heatstroke, including any of the following:\n'
            '1) Nausea or vomiting\n'
            '2) Mental confusion\n'
            '3) Fainting\n'
            '4) Seizures\n'
            '5) A fever of 104°F (40°C) or greater\n\n'
            'If they’re not vomiting or unconscious, encourage them to sip cool water or a sports drink. Take a moment now to learn about other strategies to help someone with heat exhaustion or heatstroke recover.',
            style: const TextStyle(
              color: Color(0xFF249689),
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
