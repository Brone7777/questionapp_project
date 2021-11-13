import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:questionapp_project/data/list.dart';
import 'package:questionapp_project/pages/screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Color mainColor = const Color(0xFF486D87);
  Color secondColor = const Color(0xFF2D4057);
  final PageController? _controller = PageController(initialPage: 0);
  int score = 0;

  bool isPressed = false;
  Color isTrue = Colors.green; //แสดงคำตอบว่าถูก
  Color isWrong = Colors.redAccent; //แสดงว่าผิด
  Color btnColor = const Color(0xFF117eeb);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: PageView.builder(
            //physics: const NeverScrollableScrollPhysics(),

            controller: _controller!,
            onPageChanged: (page) {
              setState(() {
                isPressed = false;
              });
            },
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "คำถาม ${index + 1}/${questions.length}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 29.0,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    height: 10.0,
                    thickness: 2.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    questions[index].question!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                  const SizedBox(
                    height: 37.0,
                  ),
                  for (int i = 0; i < questions[index].answers!.length; ++i)
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: MaterialButton(
                        shape: const StadiumBorder(),
                        color: isPressed
                            ? questions[index]
                                    .answers!
                                    .entries
                                    .toList()[i]
                                    .value
                                ? isTrue
                                : isWrong
                            : secondColor,
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        onPressed: isPressed
                            ? () {}
                            : () {
                                setState(() {
                                  isPressed = true;
                                  //btnColor = isTrue;
                                  //isTrue;
                                });
                                if (questions[index]
                                    .answers!
                                    .entries
                                    .toList()[i]
                                    .value) {
                                  score += 10;
                                  //print(score);
                                }
                              },
                        child: Text(
                          questions[index].answers!.keys.toList()[i],
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        child: Text(
                          index + 1 == questions.length
                              ? "See result"
                              : "คำถามข้อถัดไป",
                          style: const TextStyle(color: Colors.white),
                        ),
                        onPressed: isPressed
                            ? index + 1 == questions.length
                                ? () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ResultScreen(score)));
                                  }
                                : () {
                                    _controller!.nextPage(
                                        duration:
                                            const Duration(milliseconds: 450),
                                        curve: Curves.linear);
                                    setState(() {
                                      isPressed = false;
                                    });
                                  }
                            : null,
                        style: OutlinedButton.styleFrom(
                          //เดี๋ยวมาแต่งปุ่มทีหลัง
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          )),
    );
  }
}
