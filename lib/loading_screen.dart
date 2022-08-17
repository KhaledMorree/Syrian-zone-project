import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'input_page.dart';

class Loading_Screen extends StatefulWidget {
  @override
  State<Loading_Screen> createState() => _Loading_ScreenState();
}

class _Loading_ScreenState extends State<Loading_Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [


          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: SpinKitFadingCircle(
                  color: Colors.green,
                  size: 200,
                ),
              ),
            ),
          )
        ,
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InputPage();
                }));
              });
            },
            child: Text(
              'أضغط للمتابعة',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 34,
              ),
            ),
          ),
        )
        ],
      ),
    );



  }
}
