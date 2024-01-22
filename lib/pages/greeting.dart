import 'package:flutter/material.dart';
import 'package:girlfriend_translator/utils/constants.dart';


class Greeting extends StatefulWidget {
  const Greeting({super.key});

  @override
  State<Greeting> createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // sizedBox height
    double space = MediaQuery.of(context).size.height * 0.25;

    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: <Widget>[
            // page 1
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg-first.jpg"), fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: space *1.5,),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      // color: Colors.red.withOpacity(0.5),
                      child:  Column(
                        children: [
                          Text('MyPartner', style: TextStyle(fontSize: 44.0, fontWeight: FontWeight.bold, color: Colors.purple[200])),
                          const Text('A subtle or not so subtle way to', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.purple),),
                          const Text('to Communicate with your', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: Colors.purple),),
                          const Text('Lady :)', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: Colors.purple),),
                      ]),
                    )
                  ),
                  SizedBox(height: space),
                   Expanded(
                      flex: 1,
                      child: Text('Swipe right >>>', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold, color: Colors.purple[200])))
                ]

              ),
            ),

            // page 2
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg-gf-2.jpg"), fit: BoxFit.cover),
              ),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 75.0),
                    const Text('Are you', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.symmetric(horizontal: space * .4 , vertical: 8.0)
                      ),
                        onPressed: (){
                        Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: const Text('Lady', style: TextStyle(fontSize: 24.0,color: Colors.white, fontWeight: FontWeight.bold),)
                    ),
                    const SizedBox(height: 25),
                    const Text('Or', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 25),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            padding: EdgeInsets.symmetric(horizontal: space * .4 , vertical: 8.0)
                        ),
                        onPressed: (){
                          if (_pageController.hasClients) {
                            _pageController.animateToPage(
                              3,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }

                        },
                        child: const Text('Guy', style: TextStyle(fontSize: 24.0,color: Colors.white, fontWeight: FontWeight.bold),)
                    ),
                  ]
              ),
            ),

            // page 3
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg-2nd.jpg"), fit: BoxFit.cover),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: space * .2),
                    Expanded(
                        flex: 1,
                        child: Center(child: Text('SIGN UP AND SHOW HER WHAT YOU KNOW ABOUT HER', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.purple[300]),))
                    ),
                    SizedBox(height: space * .8,),
                    const Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text('She can help fill in the blanks', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                            Text("As well as give you clues to understand her better.", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                            Text("Curious? Find out how.", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, ),),

                            Icon(Icons.add)
                          ],
                        ),
                    ),
                    SizedBox(height: space * .5),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            padding: EdgeInsets.symmetric(horizontal: space * .4 , vertical: 8.0)
                        ),
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, '/register');
                        },
                        child: const Text('Sign Up', style: TextStyle(fontSize: 24.0,color: Colors.white, fontWeight: FontWeight.bold),)
                    ),
                    SizedBox(height: space * .5),

                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
