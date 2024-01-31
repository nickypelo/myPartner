import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../core/shared/loading.dart';
import '../../../information/data/models/lady_model.dart';
import '../../../information/data/repository/lady_repo.dart';
import '../../data/models/relationship_model.dart';
import '../../data/models/user_details.dart';
import '../../data/repository/auth_service.dart';
import '../../data/repository/relationship_repo_impl.dart';
import '../../data/repository/user_details_epo_impl.dart';

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
  String _anniversaryDate = '';
  String _ladyBirthDate = '';
  String error = '';
  static Map data = {};


  @override
  Widget build(BuildContext context) {

    // double space = MediaQuery.of(context).size.width;
    // props
    data = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;

    // to check if i can register
    final availablegf = Provider.of<List<RelationshipModel>>(context);


    return loading ? const Loading() : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[50],
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

                      data['role'] == 'guy'
                      ? Column(
                        children: [
                          const SizedBox(height: 20.0,),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "Your lady's birthdate: e.g. 1 April",
                                filled: true,
                                fillColor: Colors.purple[50]
                            ),
                            validator: (value){
                              return value!.isEmpty ? 'Cannot be empty.' : null;
                            },
                            onChanged: (value){
                              setState(() {
                                _ladyBirthDate = value;
                              });
                            },
                          ),
                          const SizedBox(height: 20.0,),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "Your Anniversary: e.g. 30 December",
                                filled: true,
                                fillColor: Colors.purple[50]
                            ),
                            validator: (value){
                              return value!.isEmpty ? 'Cannot be empty.' : null;
                            },
                            onChanged: (value){
                              setState(() {
                                _anniversaryDate = value;
                              });
                            },
                          ),
                        ],
                      )
                      : const Text(''),


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
                            bool cannotRegister = availablegf.indexWhere((element) => element.girlfriend == email) == -1;
                            if(cannotRegister && data['role'] == 'lady'){
                              setState(() {
                                loading = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Your guy has not created an account yet!')));
                            }
                            else{
                              dynamic result = await _auth.registration(email, pwd);
                              if(result == null){
                                setState(() {
                                  error = 'invalid credentials';
                                  loading = false;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('$error,  Try Again')));
                                });
                              }
                              else{
                                UserDetailsModel item = UserDetailsModel(
                                    userID: result.uid,
                                    firstname: _firstName,
                                    lastname: _lastName,
                                    role: data['role'],
                                    partnerEmail: _partnerEmail,
                                    fcmToken: '1'
                                );
                                RelationshipModel couple = RelationshipModel(
                                    boyfriend: email,
                                    girlfriend: _partnerEmail
                                );
                                LadyModel myLady = LadyModel(
                                  userID: result.uid,
                                  anniversaryDate: _anniversaryDate,
                                  ladyBirthDate: _ladyBirthDate,
                                );

                                UserDetailsRepoImpl().addUserDetails(item);
                                if(data['role'] == 'guy'){
                                  RelationshipRepoImpl().addRelationship(couple);
                                  LadyRepo(uid: result.uid).createLadyData(myLady);
                                }
                                  Navigator.pushReplacementNamed(context, '/');
                              }
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
                                recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, '/login'),)
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
