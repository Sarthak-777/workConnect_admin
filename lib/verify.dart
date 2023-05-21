// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class VerifyScreen extends StatelessWidget {
  var snap;
  String? uid;
  String? jobId;
  VerifyScreen({
    Key? key,
    required this.snap,
    required this.uid,
    required this.jobId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List skills = snap['skills'];
    // print(uid);
    print(jobId);

    return Scaffold(
      appBar: AppBar(
        title: Text("Verify Screen"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            FirebaseFirestore.instance
                .collection('jobs')
                .doc(jobId)
                .update({"verified": true});
          },
          child: Text("Verify")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              snap['jobTitle'],
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              snap['jobDesc'],
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              snap['jobExp'],
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              snap['jobResp'],
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Container(
              height: 500,
              child: ListView(
                children: [
                  for (int i = 0; i < skills.length; i++) Text(skills[i]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
