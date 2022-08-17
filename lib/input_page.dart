import 'package:flutter/material.dart';
import 'package:sori/history_order.dart';


import 'package:sori/result_unit.dart';
import 'package:sori/support_screen.dart';
import 'constants.dart';
import 'card.dart';
import 'cart_units.dart';





class InputPage extends StatefulWidget {
  static const String id = 'input_page';
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

Color card1Color=inactiveColor;
Color card2Color=inactiveColor;
Color card3Color=inactiveColor;
Color card4Color=inactiveColor;

String pris1='يعادل 6000 رصيد';
double resultat1=2;
String pris2= 'يعادل 12000 رصيد';
double resultat2=4.5;
String pris3='يعادل 17000 رصيد';
double resultat3=6;
String pris4='يعادل 24000 رصيد';
double resultat4=8.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'اهلا وسهلا بالجميع',
          style: TextStyle(
            color: Colors.red,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: new Drawer(
        child: ListView(
          children: [
            ElevatedButton(
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Support_screen()));
              } ,
              child: ListTile(
                leading: Icon(Icons.support_agent, color: Colors.amberAccent,
                size: 30,),
                title: Text('فريق الدعم',style: TextStyle(
                  color: Colors.lightBlueAccent
                ),),
              ),
            ),
            ElevatedButton(
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> History()));
              } ,
              child: ListTile(
                leading: Icon(Icons.menu_book, color: Colors.amberAccent,
                  size: 30,),
                title: Text('السجل',style: TextStyle(
                    color: Colors.lightBlueAccent
                ),),
              ),
            )
          ],
        ),
      ) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      calculateBrain calc  = calculateBrain(amount: pris1, result: resultat1 );
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage(resultat:
                      calc.getPris(),
                          resultatText: calc.getResult()
                      )));
                    },
                    child: Reusable_card(Colour:card1Color,
                 CardChild: Center(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text('يعادل 6000 رصيد ', style: TextStyle(
                           color: Colors.greenAccent,
                           fontSize: 16,

                         ),),
                         Text('2\$', style: KTextStyle,
                         ),
                         Icon(Icons.add, size: 40,),
                       ],
                     ),
                 ), ),
                  ) ,
                ),
                Expanded(

                  child: GestureDetector(
                    onTap: (){
                      setState((){
                    ;
                      });
                    },

                    child: GestureDetector(

                      onTap: (){
                        calculateBrain calc  = calculateBrain(amount: pris2, result:resultat2 );
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage(resultat:
                        calc.getPris(),
                            resultatText: calc.getResult()
                        )));
                      },


                      child: Reusable_card(Colour: card2Color,
                      CardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('يعادل 12000 رصيد ', style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 16,

                          ),),
                          Text('  4.5 \$  ', style: KTextStyle,),
                          Icon(Icons.add, size: 40,)
                        ],
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    calculateBrain calc  = calculateBrain(amount: pris3, result:resultat3 );
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage(resultat:
                    calc.getPris(),
                        resultatText: calc.getResult()
                    )));
                  },
                  child: Reusable_card(Colour: card3Color,
                  CardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('يعادل 17000 رصيد ', style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 16,

                      ),),

                      Text('6\$' ,style: KTextStyle,),
                      Icon(Icons.add, size: 40,)
                    ],
                  ),),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    calculateBrain calc  = calculateBrain(amount: pris4, result:resultat4 );
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage(resultat:
                    calc.getPris(),
                        resultatText: calc.getResult()
                    )));
                  },
                  child: Reusable_card(Colour: card4Color,
                  CardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('يعادل 24000 رصيد ', style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 16,

                      ),),
                      Text('8.5\$' , style: KTextStyle,),
                      Icon(Icons.add,size: 40,)
                    ],
                  )),
                ),
              ),
            ],
          ),),


             GestureDetector(
               onTap: (){
                 // calculateBrain calc  = calculateBrain(amount: pris1, result:resultat );
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> Support_screen()

                 ));
               },
               child: Container(
                child: Center(child: Text('خدمة العملاء ', style: KLargetextbutom,)),

                color: KBtomcolor,
                margin: EdgeInsets.only(top: 10)
                ,
                width: double.infinity,
                height: 60,



            ),
             ),


        ],
      ),
    );
  }
}

