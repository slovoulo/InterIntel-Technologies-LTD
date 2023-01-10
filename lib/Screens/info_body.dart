import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interintel_interview_solution/constants.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'design_screen.dart';

class InfoBody extends StatefulWidget {
  const InfoBody({Key? key}) : super(key: key);

  @override
  State<InfoBody> createState() => _InfoBodyState();
}

class _InfoBodyState extends State<InfoBody> {
  final _formKey = GlobalKey<FormState>();
  bool isEmail(String input) => EmailValidator.validate(input);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:false,
        body: SingleChildScrollView(
          child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      border: Border.all(),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome.",style: TextStyle(color:kPrimaryLightGrey,fontSize: 50 ),),
                          Text("Create your profile",style: TextStyle(color:kPrimaryLightGrey,fontSize: 30)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(key:_formKey,
                    child:Column(children: [
                      TextFormField(
                        decoration:InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Username',
                          prefixIcon: Icon(Icons.person),
                          //contentPadding: EdgeInsets.all(20),
                        ) ,

                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration:InputDecoration(
                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          //contentPadding: EdgeInsets.all(20),
                        ) ,

                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          else if(!isEmail(value)){
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration:InputDecoration(
                          focusedBorder:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),

                          hintStyle: TextStyle(fontSize: 17),
                          hintText: 'Phone',
                          prefixIcon: Icon(Icons.phone),
                          //contentPadding: EdgeInsets.all(20),
                        ) ,

                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone number is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20,),
                    ],) ),
              ),
              kTextButton(text: "Submit", width: MediaQuery.of(context).size.width*0.4, onPressed: (){
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, navigate to design page
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: DesignScreen(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                }
              })

            ],
          ),
      ),
        ),
    );
  }
}
