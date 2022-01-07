import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toys_child/blocks/model/newfirebase.dart';

/*
https://levelup.gitconnected.com/login-page-ui-in-flutter-65210e7a6c90

signin
  var result = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: myControllername.text,
                              password: myControllerpass.text);
signout
   await FirebaseAuth.instance.signOut();


*/

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final myControlleremail = TextEditingController();
  var myControllerpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Center(
              child: SizedBox(
                  width: 200,
                  height: 150,
                  /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                  child: Image.asset('image/toy.png')),
            ),
          ),
          Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: myControlleremail,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter valid email id as abc@gmail.com'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            //padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: myControllerpass,
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password'),
            ),
          ),
          TextButton(
            onPressed: () {
              //TODO FORGOT PASSWORD SCREEN GOES HERE
            },
            child: const Text(
              'Forgot Password',
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () async {
                try {
                  var result = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: 'ahmed@gamil.com', password: '123456'
                          // email: myControlleremail.text,
                          // password: myControllerpass.text
                          )
                      .then((value) async {
                    print('secssful logon !!!');
                    try {
                      var tok = await token(context);
                      UpdateDocFirebase('sender', 'admin', 'token', tok);
                    } catch (e) {
                      uplodename('sender', 'admin', 'admin', '', '', context);
                    }
                  });
                } catch (e) {
                  print('رسالة خطأ : $e');
                }

                // Navigator.push(
                // context, MaterialPageRoute(builder: (_) => HomePage()));
              },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                // Navigator.push(
                // context, MaterialPageRoute(builder: (_) => HomePage()));
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          // const SizedBox(
          //   height: 120,
          // ),
          // const Text('New User? Create Account')
        ],
      ),
    );
    ;
  }
}
