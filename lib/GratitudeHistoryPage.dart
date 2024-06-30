import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class GratitudeHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HISTORY'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('gratitude_events').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('出现错误: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('没有感恩事件记录'));
          }
          return ListView(
            children: snapshot.data!.docs.map((doc) {
              return ListTile(
                title: Text('Event 1: ${doc['event1']}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Event 2: ${doc['event2']}'),
                    Text('Event 3: ${doc['event3'] ?? '无'}'), // 如果 event3 为空，则显示 '无'
                    // 可以继续添加其他事件或字段
                  ],
                ),
                // 根据需要显示更多字段或格式化时间戳
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
