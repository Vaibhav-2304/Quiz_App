import 'package:flutter/material.dart';
import 'package:new_Project/subjects.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class ResultScreen extends StatelessWidget {
  final int userPercentage;
  final int totalRight;
  final int wrongQ;
  final int omittedQuestion;

  const ResultScreen({super.key,required this.userPercentage,
    required this.totalRight,
    required this.wrongQ,required this.omittedQuestion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Your Result"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Text(
                userPercentage < 50
                    ? "Try Again"
                    : userPercentage >= 50 && userPercentage <= 99
                    ? "You have Passed"
                    : "Perfect Score ",
                style: TextStyle(
                    fontFamily: 'Tans eek ModernProArabic',
                    fontSize: 22,
                    letterSpacing: 1,
                    color: userPercentage < 50 ? Colors.red : Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularPercentIndicator(
                    radius: 80.0,
                    lineWidth: 8.0,
                    animation: true,
                    percent: userPercentage / 100,
                    center: Text(
                      '  $userPercentage% ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Tans eekModernProArabic',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: userPercentage < 60
                            ? Colors.red
                            : const Color(0xFF008000),
                      ),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: userPercentage < 60
                        ? Colors.red
                        : const Color(0xFF008000),
                    backgroundColor: const Color(0xFFE8914F),
                  ),
                ],
              ),
              Text(
                'Your Final Result is $userPercentage%',
                style: TextStyle(
                  fontFamily: 'Tans eekModernProArabic',
                  fontSize: 22,
                  color: userPercentage < 50 ? Colors.red : Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Total Right Answers : $totalRight",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Total Wrong Answers : $wrongQ",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Total Omitted Questions : $omittedQuestion",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const SubjectsScreen(),
                      ),
                          (Route < dynamic > route) => false);
                },
                child: const Text("Start Quiz Again"),
              )
            ],
          ),
        ],
      ),
    );
  }
}


