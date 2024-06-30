import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'GratitudeTextField.dart'; // 导入自定义的GratitudeTextField类
import 'GratitudeHistoryPage.dart';

// 提交按钮的 onPressed 回调中调用此方法
void submitGratitudeEvents(List<String> events) async {
  try {
    CollectionReference eventsRef = FirebaseFirestore.instance.collection('gratitude_events');
    await eventsRef.add({
      'event1': events[0],
      'event2': events[1],
      'event3': events[2],
      'timestamp': Timestamp.now(),
    });
    print('感恩事件提交成功！');
  } catch (e) {
    print('提交感恩事件时出现错误：$e');
  }
}

class GratitudeEntryPage extends StatelessWidget {
  final TextEditingController event1Controller = TextEditingController();
  final TextEditingController event2Controller = TextEditingController();
  final TextEditingController event3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('记录感恩事件'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GratitudeHistoryPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'three beautiful things for your day：',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            GratitudeTextField(
              controller: event1Controller,
              index: 1,
            ),
            GratitudeTextField(
              controller: event2Controller,
              index: 2,
            ),
            GratitudeTextField(
              controller: event3Controller,
              index: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                List<String> events = [
                  event1Controller.text,
                  event2Controller.text,
                  event3Controller.text,
                ];
                submitGratitudeEvents(events);
                event1Controller.clear();
                event2Controller.clear();
                event3Controller.clear();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
