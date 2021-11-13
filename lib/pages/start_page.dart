import 'package:flutter/material.dart';
import 'package:questionapp_project/pages/questions_page.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: mainColor,
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
                "QUIZ APP",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              // const Text(
              //   "เริ่มทำคำถาม",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 40.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              const SizedBox(
                height: 60.0,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Homepage()));
                },
                elevation: 0.0,
                color: Colors.deepOrangeAccent,
                textColor: Colors.white,
                child: const Text("เริ่มทำคำถาม"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
