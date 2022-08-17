
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_paypal/flutter_paypal.dart';

import 'package:url_launcher/url_launcher.dart';
import 'constants.dart';


class PaymentPage extends StatefulWidget {
  final cost;

  PaymentPage({required this.cost});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final String Token_Key = "sandbox_6mfk82hj_43sxndyhm8g5z8s4";
  TextEditingController email = TextEditingController();
  TextEditingController _description = TextEditingController();
  String _email1 = 'economic@syrianzone.com';
  void ShowNonse() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(
                  'أختر سيرياتيل او ام تي ان وارسل الرقم مع صورة  تأكيد الدفع من بايبال برسالة وتس أب'),
              content: Text(' يوم سعيد'),
            ));
  }

  int Total = 0;
  void GetData() async {
    var currentuser = FirebaseAuth.instance.currentUser!.email;
    DocumentSnapshot document = await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentuser)
        .get();
    setState(() {
      Total = document["total"];
    });
  }

  @override
  void initState() {
    print("cost: ${widget.cost}");
    GetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' الدفع ',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              child: Image.asset('images/Khaled.png.jpg'),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              )),
          Flexible(
            fit: FlexFit.tight,
            child: Image.asset(
              'images/Syriatel.png',
              width: double.infinity,
            ),
          ),
          ElevatedButton(
            onPressed: () async{
                final Email email = Email(
                    body: "",
                    recipients:['support@syrianzone.com'],
                    subject: "رقم سيريتل",
                    isHTML: true
                );
                await FlutterEmailSender.send(email);
            },
            child: Center(
              child: Center(
                child: Text(
                  'أضغط لأرسال رقم سيريتل',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Image.asset(
              'images/mtn.png',
              width: double.infinity,
            ),
          ),
          ElevatedButton(
            onPressed: () async{
                final Email email = Email(
                    body: "",
                    recipients:['support@syrianzone.com'],
                    subject: "رقم أم تي أن",
                    isHTML: true
                );
                await FlutterEmailSender.send(email);
            },
            child: Text(
              'أضغط لأرسال  رقم أم تي أن',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => UsePaypal(
                  sandboxMode: false,
                  clientId:
                  "AVo4D6iiILvlpyq-6knlOGfieT2CwkfE_YdkF4Y26Bj3_tgvR9BxtWgTdub9OWSsCcL_itSjLLHAI5P6",
                  secretKey:
                  "EGhlOrdnkuTx4fWewdCYjF37NO-Tp3GMB7aIttA8KZWpA1yr5qnTCaALzGSRhOKEqQG5Gvxz__IvKj07",
                  returnURL: "https://samplesite.com/return",
                  cancelURL: "https://samplesite.com/cancel",
                  transactions: [
                    {
                      "amount": {
                        "total": '${widget.cost}',
                        "currency": "USD",
                        "details": {
                          "subtotal": '${widget.cost}',
                          "shipping": '0',
                          "shipping_discount": 0
                        }
                      },
                      "description":
                      "The payment transaction description.",
// "payment_options": {
// "allowed_payment_method":
// "INSTANT_FUNDING_SOURCE"
// },
                      "item_list": {
                        "items": [
                          {
                            "name": "رصيد",
                            "quantity": 1,
                            "price":'${widget.cost}',
                            "currency": "USD"
                          }
                        ],
                      }
                    }
                  ],
                  note: "thank you",
                  onSuccess: (Map params) async {
                    print("onSuccses: $params");
                    var currentuser = FirebaseAuth.instance.currentUser!.email;
                    final now = DateTime.now();

                    await FirebaseFirestore.instance
                        .collection("Users")
                        .doc(currentuser)
                        .collection("Orders")
                        .doc("Product $Total")
                        .set({"date": now.toString(), "cost": widget.cost});
                    await FirebaseFirestore.instance
                        .collection("Users")
                        .doc(currentuser)
                        .set({"total": Total+1});
                    ShowNonse();
                  },
                  onError: (error) {
                    print("onError: $error");
                  },
                  onCancel: (params) {
                    print('cancelled: $params');
                  }))
              );
            },
            child: Container(
              child: Center(
                  child: Text(
                'أنقر للدفع',
                style: KLargetextbutom,
              )),
              color: KBtomcolor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 60,
            ),
          ),
        ],
      ),
    );
  }
}
