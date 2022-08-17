import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  var currentuser = FirebaseAuth.instance.currentUser!.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'السجل  ',
          style: TextStyle(
            color: Colors.red,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("Users").doc(currentuser).collection("Orders").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot)
              {
                if(!snapshot.hasData){
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
                switch(snapshot.connectionState){
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                    break;
                  default:
                    return snapshot.data?.size == 0? Center(
                      child: Text("لا يوجد طلبات مسجلة"),
                    ): ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (BuildContext context, index)
                      {
                        var data = snapshot.data?.docs[index];
                        return Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(bottom: 5),
                          height: 100,
                          decoration: BoxDecoration(
                              color: Color(0xff1C838D)
                          ),
                          child: ListTile(
                            title: Text(data?["date"] +" "+ ":الوقت"),
                            subtitle: Text(data?["cost"]),
                          ),
                        );

                      },
                    );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
