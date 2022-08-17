// ignore_for_file: file_names, prefer_const_constructors, prefer_final_fields, unused_field, missing_return, annotate_overrides

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:string_validator/string_validator.dart';


class ResetPassword extends StatefulWidget {

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  GlobalKey<FormState> Key = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();

  bool is_email_exist = true;
  bool showSpinner=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اعادة تعيين كلمة السر")
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Form(
            key: Key,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.08),
              child: Column(
                children: [
                  Row(),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "?هل نسيت كلمة المرور",
                      style: TextStyle(
                        fontFamily: "openSans-regular",
                        fontSize: 30,
                        color: Color(0xff1F5F64)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "أدخل أيميلك وسوف نرسل لك رابط لتغيير كلمة السر يرجى البحث في مجلد Spam "
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      controller: _email,
                      onChanged: (newValue)
                      {
                        setState(() {
                          is_email_exist = true;
                        });
                      },
                      validator: (input)
                      {
                        if(input?.trim() == "")
                        {
                          return "Email is empty";
                        }
                        else if(isEmail(input!) == false)
                        {
                          return "Invalid email format";
                        }
                        else if(is_email_exist == false)
                        {
                          return "Email not found";
                        }
                      },
                      cursorColor: Color(0xff1C838D),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 20, left: 15),
                        hintText: "أكتب الأيميل",
                        hintStyle: TextStyle(
                          fontFamily: "raleway-regular"
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(color: Color(0xff1C838D), width: 2)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(color: Color(0xff1C838D), width: 2)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(color: Color(0xff1C838D), width: 2)
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff15636B),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                      ),
                      child: Text(
                        "أرسل رابط كلمة السر الجديدة",
                        style: TextStyle(
                          fontFamily: "openSans-regular",
                          fontSize: 18,
                          color: Colors.white
                        ),
                      ),
                      onPressed: () async
                      {
                        if(Key.currentState!.validate())
                        {
                          setState((){
                            showSpinner=true;
                          });
                          try
                          {
                            Center(
                              child: CircularProgressIndicator(

                              ),
                            );
                            await FirebaseAuth.instance.sendPasswordResetEmail(email: _email.text);
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("تم أرسال الرابط بنجاح"),
                              backgroundColor: Color(0xff16d0ba),
                            ));
                          }
                          on FirebaseAuthException catch(e,s)
                          {
                            print(e);
                            print(s);
                            if(e.code == 'user-not-found')
                            {
                              Navigator.of(context).pop();
                              setState(() {
                                is_email_exist = false;
                              });
                            }
                          }
                          catch(e,s)
                          {
                            print(e);
                            print(s);

                          }
                          setState((){
                            showSpinner=false;
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  )
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}