import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:workconnect_admin/verify.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = FirebaseFirestore.instance
        .collection("jobs")
        .where("verified", isEqualTo: false)
        .get();
    // print(data.then((value) {
    //   print(value.docs);
    // }));
    return Scaffold(
        appBar: AppBar(
          title: Text("Admin Panel"),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("jobs")
              .where("verified", isEqualTo: false)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading...");
            }
            print(snapshot.data!.docs.length);
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 0),
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () => Get.to(
                  () => VerifyScreen(
                    snap: snapshot.data!.docs[index].data(),
                    uid: snapshot.data!.docs[index].data()['uid'],
                    jobId: snapshot.data!.docs[index].data()['jobId'],
                  ),
                ),
                child: SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              snapshot.data!.docs[index].data()['username'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              snapshot.data!.docs[index].data()['jobTitle'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            );
          },
        ));
  }
}
