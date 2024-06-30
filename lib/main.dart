import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'GratitudeEntryPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
   await Firebase.initializeApp(options: FirebaseOptions(
        apiKey: "AIzaSyDVa35QVa9Q_wYj4jtZr_x9-MDLvSpLLDo",
        authDomain: "enough-6c764.firebaseapp.com",
        projectId: "enough-6c764",
        storageBucket: "enough-6c764.appspot.com",
        messagingSenderId: "282142736853",
        appId: "1:282142736853:web:7fa00b8d898378cb5afd5c",
        measurementId: "G-LGM75M31GJ"
    ));
  }else{
    await Firebase.initializeApp();
  }
    runApp(const MyApp());
  }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gratitude Journal',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主页'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => MeditationPage()),
                // );

              },
              icon: Icon(Icons.self_improvement),
              label: Text('Breath'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GratitudeEntryPage()),
                );
              },
              icon: Icon(Icons.edit),
              label: Text('Writing'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

