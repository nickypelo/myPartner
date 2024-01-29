import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:girlfriend_translator/features/authentication/data/models/relationship_model.dart';
import 'package:girlfriend_translator/features/authentication/data/repository/relationship_repo_impl.dart';
import 'package:girlfriend_translator/features/authentication/data/repository/user_details_epo_impl.dart';
import 'package:girlfriend_translator/features/authentication/domain/entities/relationship_entity.dart';
import 'package:girlfriend_translator/features/authentication/domain/entities/user_entity.dart';
import 'package:provider/provider.dart';

import '../../../../core/shared/loading.dart';
import '../../data/models/user_details.dart';
import '../../data/repository/auth_service.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  // loading screen
  bool loading = false;

  // text field state
  String _firstName = '';
  String _lastName = '';
  String email = '';
  String _partnerEmail = '';
  String pwd = '';
  String pwdConfirm = '';
  String error = '';
  static Map data = {};


  @override
  Widget build(BuildContext context) {

    double space = MediaQuery.of(context).size.width;
    // props
    data = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;


    return loading ? const Loading() : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        // iconTheme: Colors.purple,
        title: const Text('REGISTER.', style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w900, color: Colors.purple),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg-first.jpg'), fit: BoxFit.cover
            )
          ),
            padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Begin your journey.', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900, color: Colors.purple),),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 50.0,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'First Name:',
                          filled: true,
                          fillColor: Colors.purple[50]
                        ),
                        validator: (value){
                          return value!.isEmpty ? 'Cannot be empty.' : null;
                        },
                        onChanged: (value){
                          setState(() {
                            _firstName = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20.0,),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Last Name:',
                            filled: true,
                            fillColor: Colors.purple[50]
                        ),
                        validator: (value){
                          return value!.isEmpty ? 'Cannot be empty.' : null;
                        },
                        onChanged: (value){
                          setState(() {
                            _lastName = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20.0,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Your Email:",
                          filled: true,
                          fillColor: Colors.purple[50],
                        ),
                        validator: (value){
                          return value!.isEmpty ? 'Enter a valid email.' : null;
                        },
                        onChanged: (value){
                          email = value;
                        },
                      ),
                      const SizedBox(height: 20.0,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: data['role'] == 'guy' ? "Your Lady's email:" : "Your Guy's email",
                          filled: true,
                          fillColor: Colors.purple[50],
                        ),
                        validator: (value){
                          return value!.isEmpty ? 'Enter a valid email.' : null;
                        },
                        onChanged: (value){
                          _partnerEmail = value;
                        },
                      ),
                      const SizedBox(height: 20.0,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Create Password',
                          filled: true,
                          fillColor: Colors.purple[50],
                        ),
                        validator: (value){
                          return value!.length < 6 ? 'Password must have more than 6 characters' : null;
                        },
                        obscureText: true,
                        onChanged: (value){
                          pwd = value;
                        },
                      ),
                      const SizedBox(height: 20.0,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          filled: true,
                          fillColor: Colors.purple[50],
                        ),
                        validator: (value){
                          return value != pwd ? 'Passwords must match' : null;
                        },
                        obscureText: true,
                        onChanged: (value){
                          pwdConfirm = value;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80.0,),
                Column(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 12.0)
                        ),
                        onPressed: () async {
                          if(_formKey.currentState!.validate()){
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth.registration(email, pwd);
                            if(result == null){
                              setState(() {
                                error = 'invalid credentials';
                                loading = false;
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Try Again')));
                              });
                            }
                            else{
                              UserDetailsModel item = UserDetailsModel(
                                  userID: result.uid,
                                  firstname: _firstName,
                                  lastname: _lastName,
                                  role: data['role'],
                                  partnerEmail: _partnerEmail,
                                  fcmToken: await FirebaseMessaging.instance.getToken()

                          );
                              RelationshipModel couple = RelationshipModel(
                                  boyfriend: email,
                                  girlfriend: _partnerEmail
                              );

                              // print(item.firstname);
                              print('registration');
                              UserDetailsRepoImpl().addUserDetails(item);
                              RelationshipRepoImpl().addRelationship(couple);
                              // print(couple.boyfriend);
                            }
                          }
                        },
                        child: const Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                    const SizedBox(height: 10.0,),
                    RichText(
                        text: TextSpan(
                          text: 'Already have an account?',
                          style: const TextStyle(color: Colors.black54),
                          children: [
                            TextSpan(text: ' Sign In', style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushReplacementNamed(context, '/login'))
                          ]
                        ),
                    )
                  ],
                ),

              ],
            )
        ),
      ),
    );
  }
}
