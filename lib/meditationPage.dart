import 'package:flutter/material.dart';
import 'dart:async';
import'GratitudeEntryPage.dart';

class meditationPage extends StatefulWidget {
  @override
  _meditationPageState createState() => _meditationPageState();
}

class _meditationPageState extends State<meditationPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showBreathText = false;
  bool _showWritingButton = false;
  String _breathText = "Breath in";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
        setState(() {
          _breathText = "Breath out";
        });
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
        setState(() {
          _breathText = "Breath in";
        });
      }
    });
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // 显示提示语3秒钟
    Timer(Duration(seconds: 3), () {
      setState(() {
        _showBreathText = true;
        _controller.forward();
      });

      // 冥想1分钟后结束
      Timer(Duration(minutes: 1), () {
        setState(() {
          _showWritingButton = true;
        });
      });
    });
  }

  void _skipMeditation() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GratitudeEntryPage()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditation'),
        actions: [
          TextButton(
            onPressed: _skipMeditation,
            child: Text(
              'jump over',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _showBreathText
                ? FadeTransition(
              opacity: _animation,
              child: Text(
                _breathText,
                style: TextStyle(fontSize: 24),
              ),
            )
                : Text(
              'relax and focus on yourself',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            if (_showWritingButton)
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GratitudeEntryPage()),
                  );
                },
                icon: Icon(Icons.edit),
                label: Text('gratitude'),
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
