import 'package:flutter/material.dart';
import 'package:girlfriend_translator/service/auth/authService.dart';
import 'package:girlfriend_translator/utils/constants.dart';

import '../../utils/loading.dart';

class Register extends StatefulWidget {
  const Register({super.key, required this.toggleView});

  final Function toggleView;
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String pwd = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: Text('Register', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: [
          TextButton.icon(
            icon: Icon(Icons.person, color: Colors.white,),
            label: Text('Sign In', style: TextStyle(color: Colors.white),),
            onPressed: (){
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: textInputDecoration,
                  validator: (value){
                    return value!.isEmpty ? 'Enter an Email' : null;
                  },
                  onChanged: (value){
                    setState(() {
                      email = value;
                    });
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                  validator: (value){
                    return value!.length < 6 ? 'Password must have more than 6 characters' : null;
                  },
                  obscureText: true,
                  onChanged: (value){
                    pwd = value;
                  },
                ),
                SizedBox(height: 20.0,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple
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
                    child: Text('Register', style: TextStyle(color: Colors.white,)))
              ],
            ),
          )
      ),
    );
  }
}
