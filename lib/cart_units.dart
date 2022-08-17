
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sori/card.dart';
import 'constants.dart';
import 'package:http/http.dart';
import 'PaymentPage.dart';

class CartPage extends StatefulWidget {

  CartPage({required this.resultat,required this.resultatText});

final String resultat;
final String resultatText;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
final String Token_Key="sandbox_6mfk82hj_43sxndyhm8g5z8s4";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' سلة المشتريات ',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 1,
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,

              child: Text(
                'الكمية',
                style: KTextStyle,

              ),
            ),
          ),
          Expanded(flex: 5,
            child: Reusable_card(Colour: Colors.black12,
              CardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.resultat,
                    style: KColoramount,
                  ),
                  Text(widget.resultatText ,style: KTextdolar,),
                  Text('الدفع فقط عن طريق بايبال أو  أرسال رسالة ل فريق الدعم',
                  style: KTextStyledolar,)
                ],
              ),
            ),
          ),


          GestureDetector(
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage(cost: widget.resultatText)));
            },

            child: Container(
              child: Center(child: Text('أختيار  للدفع', style: KLargetextbutom,)),

              color: KBtomcolor,
              margin: EdgeInsets.only(top: 10)
              ,
              width: double.infinity,
              height: 60,



            ),
          )
        ],

      ),

    );
  }
}
