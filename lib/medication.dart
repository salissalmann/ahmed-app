import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class MedicationPage extends StatefulWidget {
  const MedicationPage({Key? key}) : super(key: key);

  @override
  _MedicationPageState createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {
  DateTime? _selectedDateTime;
  TextEditingController _medicineController = TextEditingController();
  Map<DateTime, List<String>> _events = {};
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Karachi')); // Set your local timezone here
    initializeNotifications();
    requestNotificationPermission();

    _scheduleTestNotification();
  }

  Future<void> initializeNotifications() async {
    print("Initializing notifications...");
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('drawable/welcome');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    print("Notifications initialized.");
  }

  Future<void> requestNotificationPermission() async {
    if (Platform.isAndroid) {
      var status = await Permission.notification.status;
      if (status != PermissionStatus.granted) {
        status = await Permission.notification.request();
      }
      if (status == PermissionStatus.granted) {
        print("Notification permission granted.");
      } else {
        print("Notification permission denied.");
      }
    }
  }

  Future<void> _scheduleNotification(DateTime dateTime, String medicineName) async {
    print("Scheduling notification for $medicineName at $dateTime");
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'alarm_channel',
      'Alarm',
      importance: Importance.high,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('alarm_sound'),
      playSound: true,
    );
    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      dateTime.hashCode,
      'Time to take medicine',
      'Take $medicineName now!',
      tz.TZDateTime.from(dateTime, tz.local),
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time, // This ensures the notification repeats daily
    );
    print("Notification scheduled.");
  }

  Future<void> _scheduleTestNotification() async {
    print("Scheduling test notification...");
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'test_channel',
      'Test Notification',
      importance: Importance.high,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('alarm_sound'),
      playSound: true,
    );
    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Test Notification',
      'This is a test notification',
      tz.TZDateTime.now(tz.local).add(Duration(seconds: 10)),
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
    print("Test notification scheduled.");
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(), // Users can only select the current date or future dates
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          _showMedicineInputDialog();
        });
      }
    }
  }

  void _showMedicineInputDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Medicine Name', style: TextStyle(color: Color(0xFF249689))),
          content: TextField(
            controller: _medicineController,
            decoration: InputDecoration(
              hintText: 'Enter medicine name',
              hintStyle: TextStyle(color: Color(0xFF249689)),
            ),
            style: TextStyle(color: Color(0xFF249689)),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _addAlarm();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF249689), // background color
              ),
              child: Text('Confirm', style: TextStyle(color: Color(0xFFecfdc598))),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF249689), // background color
              ),
              child: Text('Cancel', style: TextStyle(color: Color(0xFFecfdc598))),
            ),
          ],
        );
      },
    );
  }

  void _addAlarm() {
    if (_selectedDateTime != null && _medicineController.text.isNotEmpty) {
      final dateTime = _selectedDateTime!;
      final userId = currentUser?.uid;

      if (userId != null) {
        setState(() {
          _events.update(
            dateTime,
            (value) => value..add(_medicineController.text),
            ifAbsent: () => [_medicineController.text],
          );
          FirebaseFirestore.instance.collection('alarms').add({
            'dateTime': dateTime,
            'medicineName': _medicineController.text,
            'userId': userId,
          });
          _scheduleNotification(dateTime, _medicineController.text);
          _medicineController.clear();
          _selectedDateTime = null;
        });
        Navigator.of(context).pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User not logged in.'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select date, time, and enter medicine name.'),
        ),
      );
    }
  }

  void _deleteAlarm(String alarmId, DateTime dateTime) {
    setState(() {
      _events.remove(dateTime);
      _deleteNotification(dateTime);
      FirebaseFirestore.instance.collection('alarms').doc(alarmId).delete();
    });
  }

  Future<void> _deleteNotification(DateTime dateTime) async {
    await flutterLocalNotificationsPlugin.cancel(dateTime.hashCode);
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Medication Reminder', style: TextStyle(color: Color(0xFF249689))),
        centerTitle: true,
        backgroundColor: Color(0xFFecfdc598),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xFF249689),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Medicines to take',
              style: TextStyle(
                  fontSize: screenHeight * 0.02,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF249689)),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(screenHeight * 0.03),
                  topRight: Radius.circular(screenHeight * 0.03),
                ),
              ),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('alarms')
                    .where('userId', isEqualTo: currentUser?.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final alarms = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: alarms.length,
                    itemBuilder: (context, index) {
                      final alarm = alarms[index];
                      final dateTime = (alarm['dateTime'] as Timestamp).toDate();
                      final medicineName = alarm['medicineName'];
                      final alarmId = alarm.id;

                      return Card(
                        margin: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.005,
                            horizontal: screenWidth * 0.02),
                        color: Color(0xFF249689),
                        child: ListTile(
                          title: Text(
                            medicineName,
                            style: TextStyle(
                                color: Color(0xFFe6e6fa),
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * 0.02),
                          ),
                          subtitle: Text(
                            DateFormat('yyyy-MM-dd HH:mm').format(dateTime),
                            style: TextStyle(
                                color: Color(0xFFe6e6fa),
                                fontSize: screenHeight * 0.015),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Color(0xFFe6e6fa)),
                            onPressed: () {
                              _deleteAlarm(alarmId, dateTime);
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _selectDateTime(context);
        },
        backgroundColor: Color(0xFFecfdc598),
        child: Icon(Icons.add, color: Color(0xFF249689)),
      ),
    );
  }
}
