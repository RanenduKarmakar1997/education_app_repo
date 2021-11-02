import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('T90'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'To view results',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
            Text(
              'Sign In',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      filled: true,
                      fillColor: Colors.grey[300],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Your Phone Number',
                      filled: true,
                      fillColor: Colors.grey[300],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Parent\'s/ Guardian\'s Name',
                      filled: true,
                      fillColor: Colors.grey[300],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Parent\'s/ Guardian\'s Mobile Number',
                      filled: true,
                      fillColor: Colors.grey[300],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Same number as above',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        //SizedBox(width: 10), //SizedBox
                        Checkbox(
                          value: this.value,
                          onChanged: (value) {
                            setState(() {
                              value = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(8.0),
                    height: 50.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        width: 1.2,
                        color: Colors.grey,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: this.value,
                        onChanged: (value) {
                          setState(() {
                            value = value;
                          });
                        },
                      ),
                      Text(
                        'Terms & Conditions',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
