import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:workconnect_admin/login.dart';
import 'package:workconnect_admin/verify.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = FirebaseFirestore.instance
        .collection("jobs")
        .where("verified", isEqualTo: false)
        .get();

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
