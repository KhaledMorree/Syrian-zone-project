import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

import 'package:sori/screens/constants.dart';

import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

class Support_screen extends StatefulWidget {
  static String id = 'support_screen';
  @override
  State<Support_screen> createState() => _Support_screenState();
}

class _Support_screenState extends State<Support_screen> {
  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '0047-94288174',
      text: "مرحبا احتاج مساعدة",
    );
    link.toString();
    // Use either Dart's string interpolation or the toString() method.
    // The "launch" method is part of "url_launcher".
    await launch('$link');
  }

  TextEditingController recipientControler = TextEditingController();
  TextEditingController subjectControler = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'فريق الدعم',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.lightBlueAccent),
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            TextFormField(
                controller: subjectControler,
                decoration:
                    KTextfeilddecoration.copyWith(hintText: 'ما هي مشكلتك')),
            Container(
              height: 200,
              child: TextFormField(
                controller: bodyController,
                keyboardType:TextInputType.multiline,
                maxLines: 100,
                maxLength: 1000,
                decoration: KTextfeilddecoration.copyWith(hintText: 'نص الرسالة'),
              ),
            ),
            GestureDetector(
              onTap: () async {
                String recipeint = recipientControler.text;
                String subject = subjectControler.text;
                String body = bodyController.text;

                // final Uri email = Uri(
                //   scheme: 'mailto',
                //   path: recipeint,
                //   query: 'subject' +
                //       Uri.decodeComponent(subject) +
                //       '&body' +
                //       Uri.decodeComponent(body),
                // );
                // if (await canLaunchUrl(email)) {
                //   await launchUrl(email);
                // } else {
                //   debugPrint('error');
                // }
                final Email email = Email(
                    body: bodyController.text,
                    recipients:['support@syrianzone.com'],
                    subject: subjectControler.text,
                    isHTML: true
                );
                await FlutterEmailSender.send(email);
              },
              child: Container(
                height: 50,
                width: 120,
                color: Colors.yellow,
                child: Center(
                  child: Text(
                    'أرسل',
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text('للتواصل عن طريق واتساب ',style:TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),),

            Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [




               GestureDetector(
                onTap: () {
                  launchWhatsApp();
                },
                child: Container(
                  height: 50,
                  width: 120,
                  color: Colors.brown,
                  child:  Icon(Icons.whatsapp, color: Colors.green,
                  ),

                ),
                ),

            ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
