import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:questionapp_project/pages/start_page.dart';

class ResultScreen extends StatefulWidget {
  final int score;

  const ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pexels-bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "คำถามหมดแล้ว!",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              const Text(
                "คะแนนที่คุณได้ก็คือ",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              Text(
                "${widget.score}/150",
                style: const TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 80.0,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StartScreen()));
                },
                elevation: 0.0,
                color: Colors.deepOrangeAccent,
                textColor: Colors.white,
                child: const Text("กลับหน้าหลัก"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
