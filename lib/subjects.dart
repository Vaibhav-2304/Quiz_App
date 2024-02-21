import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_Project/quiz_screen.dart';


class SubjectsScreen extends StatelessWidget{
  const SubjectsScreen ({super.key});

  final List subjectList = const[
    {"subject_name" : "Physics" , "subject_id" : "101"},
    {"subject_name" : "Chemistry" , "subject_id" : "102"},
    {"subject_name" : "Mathematics" , "subject_id" : "103"},
  ];

  @ override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Subjects List"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),

            ...subjectList.map((e) =>Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                onTap: (){
                  if (kDebugMode) {
                    print(e["subject_id"]);
                  }
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const QuizScreen(),),);
                },
                tileColor: Colors.amber,
                textColor: Colors.black87,
                iconColor: Colors.black87,
                title: Text(e["subject_name"],),
                trailing: const Icon(Icons.arrow_forward_ios_sharp),),
            ) ,).toList()

          ],
        ),
      ),
    );
  }
}