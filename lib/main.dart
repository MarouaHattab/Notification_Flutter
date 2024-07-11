import 'package:flutter/material.dart';
import 'local_notif_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
          useMaterial3: true,
        ),
        home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Notification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              onTap: () {
                LocalNotifService.showBasicNotification();
              },
              leading: Icon(Icons.notifications),
              title: Text('Basic Notification '),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
              ),
            ),
                ListTile(
              onTap: () {
                LocalNotifService.scheduledNotification();
              },
              leading: Icon(Icons.notifications),
              title: Text('Schedule Notification '),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
