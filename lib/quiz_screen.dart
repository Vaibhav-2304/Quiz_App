import 'package:flutter/material.dart';
import 'package:new_Project/result_screen.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  List quizListData = [
    {
      "id" : 1,
      "answer" : "4:1",
      "answer_description" : "",
      "is_answered" :0,
      "is_answer_status_right_wrong_omitted" : 0,
      "title":
      "De-Broglie wavelength of alpha particle is the same as that of a proton moving with 1/10 of velocity as the speed of light. The ratio of K.E. of proton to that of alpha particle is ",
      "options": [
        {
          "option" : "a",
          "value"  : "2:1",
          "color"  : "0xFFffffff"
        },
        {
          "option" : "b",
          "value"  : "1:4",
          "color"  : "0xFFffffff",
        },
        {
          "option" : "c",
          "value"  : "4:1",
          "color"  : "0xFFffffff",
        },
        {
          "option" : "d",
          "value"  : "4:3",
          "color"  : "0xFFffffff"
        },

      ],
    },
    {
      "id" : 2,
      "answer" : "ALBERT EINSTEIN",
      "answer_description" : "",
      "is_answered" :0,
      "is_answer_status_right_wrong_omitted" : 0,
      "title":
      "Who had given us concept of theory of relativity ? ",
      "options": [
        {
          "option" : "a",
          "value"  : "BENJAMIN FRANKLIN",
          "color"  : "0xFFffffff"
        },
        {
          "option" : "b",
          "value"  : "ALBERT EINSTEIN",
          "color"  : "0xFFffffff",
        },
        {
          "option" : "c",
          "value"  : "DE - BROGLIE",
          "color"  : "0xFFffffff",
        },
        {
          "option" : "d",
          "value"  : "NIKOLA TESLA",
          "color"  : "0xFFffffff"
        },

      ],
    },
  ];

  final _pageController = PageController(initialPage: 0);
  int questionIndex = 0;

  int userPercentage = 0;
  int wrongQ = 0;
  int omittedQuestion = 0;
  int totalRight = 0;

  quizResult(context){
    userPercentage = 0;
    wrongQ = 0;
    omittedQuestion = 0;
    totalRight = 0;

    for (int i = 0; i < quizListData.length; i++) {
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 0) {
        omittedQuestion++;
      }
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 1) {
        totalRight++;
      }
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 2) {
        wrongQ++;
      }
    }

    userPercentage = ((totalRight / quizListData.length) * 100).round();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            userPercentage: userPercentage,
            totalRight: totalRight,
            wrongQ: wrongQ,
            omittedQuestion: omittedQuestion,
          ),
        ),
            (Route < dynamic > route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      appBar: AppBar(
        title: const Text("Test Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Question :${questionIndex + 1}/${quizListData.length}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: quizListData.length,
                onPageChanged: (page) {
                  print("Current page $page");
                  setState(
                        () {
                      questionIndex = page;
                    },
                  );
                },
                itemBuilder:(context,index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFBF00),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            quizListData[index]['title'],
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                        ),

                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      quizListData[index]
                      ['is_answer_status_right_wrong_omitted'] ==
                          2
                          ? Text(
                        "Right answer is :  ${quizListData[index]['answer']} ",
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      )
                          : const SizedBox(),
                      const SizedBox(
                        height: 20,
                      ),
                      ...quizListData[index]['options']
                          .map(
                            (data) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: SizedBox(
                            width: double.infinity,
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(
                                    int.parse(
                                      data['color'],
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  if (quizListData[index]['is_answered'] ==
                                      0) {
                                    setState(() {
                                      if (data['value'] ==
                                          quizListData[index]['answer']) {
                                        data['color'] = "0xFF31CD63";
                                        quizListData[index][
                                        'is_answer_status_right_wrong_omitted'] = 1;
                                      } else {
                                        data['color'] = "0xFFFF0000";
                                        quizListData[index][
                                        'is_answer_status_right_wrong_omitted'] = 2;
                                      }
                                      quizListData[index]['is_answered'] =
                                      1;
                                    });
                                  } else { }
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Color(
                                            int.parse(
                                              data['color'],
                                            ),
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            data['option'].toUpperCase(),
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        data['value'],
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                          .toList(),

                    ],
                  );

                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (questionIndex == quizListData.length - 1) {
            quizResult(context);
          } else {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 5),
              curve: Curves.easeIn,
            );
          }
        },
        label:
        Text(questionIndex == quizListData.length - 1 ? "Submit" : "Next"),
      ),

    );
  }
}
