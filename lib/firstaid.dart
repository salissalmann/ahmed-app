import 'package:flutter/material.dart';
import 'firstaid/breathing_problem_page.dart';
import 'firstaid/heatstroke_page.dart';
import 'firstaid/cardiac_arrest_page.dart';
import 'firstaid/treating_a_burn_page.dart';
import 'firstaid/nosebleeds_page.dart';
import 'firstaid/choking_page.dart';

class FirstAidPage extends StatelessWidget {
  static const Color backgroundColor = Color(0xFFecfdc598);
  static const Color textColor = Color(0xFF249689);
  static const Color iconColor = Color(0xFF249689);

  FirstAidPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      color: textColor,
      fontSize: 20,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'First Aid Information',
          style: TextStyle(color: Color(0xFF249689)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned(
            right: -80,
            bottom: -80,
            child: CircleAvatar(
              backgroundColor:Color(0xFFe6e6fa),
              radius: 110,
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                  _buildListTile('Breathing Problem', context, textStyle, const BreathingProblemPage()),
                  _buildListTile('Heatstroke', context, textStyle, const HeatstrokePage()),
                  _buildListTile('Cardiac Arrest', context, textStyle, const CardiacArrestPage()),
                  _buildListTile('Treating a Burn', context, textStyle, const TreatingABurnPage()),
                  _buildListTile('Nosebleeds', context, textStyle, const NosebleedsPage()),
                  _buildListTile('Choking', context, textStyle, const ChokingPage()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(String title, BuildContext context, TextStyle textStyle, Widget page) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      leading: Icon(Icons.check_circle, color: iconColor, size: 30),
      title: Text(title, style: textStyle, textAlign: TextAlign.center),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'First Aid App',
    home: FirstAidPage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  ));
}

