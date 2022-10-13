import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE4ECF9),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Color(0xff081B37)),
          title: Text(
            'Register Here!',
            style: TextStyle(color: Color(0xff081B37)),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          centerTitle: true,
          backgroundColor: Color(0xffE4ECF9),
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
            child: Column(children: [
              SizedBox(
                height: 40,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  trailing: Icon(Icons.person),
                  title: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Name", border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  trailing: Icon(Icons.email),
                  title: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Email", border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  trailing: Icon(Icons.lock),
                  title: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Password", border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              MaterialButton(
                  onPressed: () {},
                  child: Text('Register'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: Color(0xff0b254b),
                  textColor: Colors.white,
                  minWidth: MediaQuery.of(context).size.width / 2),
            ]),
          ),
        ));
  }
}
