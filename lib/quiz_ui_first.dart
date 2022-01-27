import 'package:flutter/material.dart';

class QuizOne extends StatefulWidget {
  QuizOne({Key? key}) : super(key: key);

  @override
  State<QuizOne> createState() => _QuizOneState();
}

class _QuizOneState extends State<QuizOne> {
  List<bool> isTouched = List.generate(4, (index) => false);
  Color color = Colors.purple;

  @override
  Widget build(BuildContext context) {
    double size = 50;
    return Scaffold(
        body: Container(
      // height: double.infinity,
      color: Color(0xfff8f7f9),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xffa25cd9),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )),
                height: 250,
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: -100,
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 250,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 5,
                    color: Colors.white,
                    shadowColor: Colors.purple,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    style: TextStyle(
                                        color: Colors.purple, fontSize: 20),
                                    text: "Question 13"),
                                TextSpan(
                                    style: TextStyle(
                                        color: Colors.purple, fontSize: 15),
                                    text: "/20")
                              ])),
                              SizedBox(
                                height: 50,
                              ),
                              Text(
                                "How many students in you class ___ from korea ?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    height: 1.6),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            top: -40,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: CircularProgressIndicator(
                                        color: Colors.purple,
                                        value: 0.7,
                                      ),
                                    ),
                                    Text("18",
                                        style: TextStyle(
                                            color: Colors.purple,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16))
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 200),
            child: Column(
              children: [...List.generate(4, (index) => answerButton(index))],
            ),
          )
        ],
      ),
    ));
  }

  Widget answerButton(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 400,
        height: 50,
        // color: Colors.red,
        child: OutlinedButton(
          onPressed: () {
            setState(() {
              isTouched[index] = true;
            });
            print("Pressed");
          },
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                side: BorderSide(color: color, width: 2.0), // HERE
              ),
              side: BorderSide(
                  color: isTouched[index] ? Colors.purple : Colors.black12,
                  width: 2.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Tapped");
                      setState(() {});
                    },
                    child: Text(
                      'Outlined button',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Serif"),
                    ),
                  ),
                  Icon(Icons.check_circle, color: Colors.purple, size: 20)
                ]),
          ),
        ),
      ),
    );
  }
}
