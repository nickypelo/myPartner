import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:girlfriend_translator/service/auth/authService.dart';
import 'package:girlfriend_translator/utils/constants.dart';

import '../../utils/loading.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String _fullName = '';
  String _ladyFullName = '';
  String email = '';
  String pwd = '';
  String error = '';

  @override
  Widget build(BuildContext context) {

    //
    double space = MediaQuery.of(context).size.width;

    return loading ? Loading() : Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg-first.jpg'), fit: BoxFit.cover
          )
        ),
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             const Text('Register Your Account.', style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.purple),),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 10.0,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Full Names:',
                        filled: true,
                        fillColor: Colors.purple[50]
                      ),
                      validator: (value){
                        return value!.isEmpty ? 'Cannot be empty.' : null;
                      },
                      onChanged: (value){
                        setState(() {
                          _fullName = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10.0,),
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
                    const SizedBox(height: 10.0,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Your Lady's full Names:",
                        filled: true,
                        fillColor: Colors.purple[50],
                      ),
                      validator: (value){
                        return value!.isEmpty ? 'Cannot be empty.' : null;
                      },
                      onChanged: (value){
                        _ladyFullName = value;
                      },
                    ),
                    const SizedBox(height: 10.0,),
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
                    const SizedBox(height: 10.0,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        filled: true,
                        fillColor: Colors.purple[50],
                      ),
                      validator: (value){
                        return value!.length < 6 ? 'Passwords must match' : null;
                      },
                      obscureText: true,
                      onChanged: (value){
                        pwd = value;
                      },
                    ),
                  ],
                ),
              ),
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
                            });
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
    );
  }
}
