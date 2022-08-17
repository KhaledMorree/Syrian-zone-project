import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sori/input_page.dart';


import 'package:sori/loading_screen.dart';
import 'package:sori/screens/login_screen.dart';
import 'package:sori/screens/registration_screen.dart';
import 'package:sori/screens/welcome_screen.dart';

String? is_user_available;

String isUserAvailable() {
  if(FirebaseAuth.instance.currentUser != null)
  {
    return 'available';
  }
  else{
    return 'no user';
  }
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  is_user_available = isUserAvailable();
  runApp(Ana_sori());
}



class Ana_sori extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        initialRoute: is_user_available == 'available'? InputPage.id: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          InputPage.id: (context) => InputPage()
        }

    );
  }
}



