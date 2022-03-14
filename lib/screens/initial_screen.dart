import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Sabka Bazaar",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 40
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 14,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Image(image: AssetImage('assets/images/shopping.png')),
                  Column(
                    children: [
                      MaterialButton(
                        minWidth: double.infinity,
                        height:60,
                        onPressed: (){
                          Navigator.pushNamed(context, '/login');
                        },
                        color: Colors.indigoAccent[400],
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: const Text("Login",style: TextStyle(
                            fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white70
                        ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width),
              color: Colors.grey.shade200,
              child: const Text(
                'Copyright © 2011-2022 Sabka Bazaar Grocery Supplies Pvt Ltd',
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.black
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
