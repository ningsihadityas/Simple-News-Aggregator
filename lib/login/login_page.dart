import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlipper/homepage/homepage_login.dart';
import 'package:qlipper/homepage/homepage.dart';
import 'package:qlipper/register/register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        //backgroundColor: Color(0xffE4ECF9),
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
            child: Column(children: [
              SizedBox(
                height: 110,
              ),
              Text(
                'welcome to',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'QLIPPER!',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      trailing: Icon(Icons.mail),
                      title: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Email", border: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      trailing: Icon(Icons.lock),
                      title: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Password", border: InputBorder.none),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              MaterialButton(
                  onPressed: () {},
                  child: Text('Log In'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: Color(0xff0b254b),
                  textColor: Colors.white,
                  minWidth: MediaQuery.of(context).size.width / 2),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ));
                },
                child: Text('No account? Create one here!'),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
                child: Text('Log in later'),
              )
            ]),
          ),
        ));
  }
}
