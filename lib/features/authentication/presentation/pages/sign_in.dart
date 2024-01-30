import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:girlfriend_translator/core/shared/loading.dart';

import '../../data/repository/auth_service.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String pwd = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    // height space
    double space = MediaQuery.of(context).size.width;

    return loading ? const Loading() : Scaffold(
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
              // SizedBox(height: space * .35,),
              Container(
                // margin: const EdgeInsets.only(top: 50),
                width: space,
                height: space * .5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/signIn.png')
                  )
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const Text('Log In Your Account.', style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.purple),),
                    const SizedBox(height: 20.0,),
                    TextFormField(
                      decoration:  InputDecoration(
                        hintText: 'Email',
                        filled: true,
                        fillColor: Colors.purple[50],
                      ),
                      validator: (value){
                        return value!.isEmpty ? 'Enter an Email' : null;
                      },
                      onChanged: (value){
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    const SizedBox(height: 15.0,),
                    TextFormField(
                      decoration:  InputDecoration(
                        hintText: 'Password',
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
                  ],
                ),
              ),
              SizedBox(height: space * .4,),
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
                          dynamic result = await _auth.signIn(email, pwd);
                          if(result == null){
                            setState(() {
                              error = 'invalid credentials';
                              loading = false;
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Try Again')));
                            });
                          }
                        }
                      },
                      child: const Text('Sign In', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                  const SizedBox(height: 10.0,),
                  RichText(
                    text: TextSpan(
                        text: "You don't have an account?",
                        style: const TextStyle(color: Colors.black54),
                        children: [
                          TextSpan(text: ' Sign Up', style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushReplacementNamed(context, '/register'))
                        ]
                    ),
                  ),
                  const SizedBox(height: 50.0,),
                ],
              ),
        
            ],
          )
        ),
      ),
    );
  }
}
