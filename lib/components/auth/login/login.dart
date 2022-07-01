import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final textController = TextEditingController();
  int textInput = 0;

  void initState() {
    super.initState();

    textController.addListener(handleTextInputLength);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void handleTextInputLength() {
    setState(() {
      textInput = textController.value.text.length;
    });
    // print(textController.value.text.length);
  }

  void handleVerificationClick() {
    print('todo: verification');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.grey[850],
      child: Stack(
        children: [
          Positioned(
            left: 12.0,
            top: 55.0,
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Back',
                style: TextStyle(
                  color: Colors.amber[300],
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Center(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  child: Image.asset(
                    'assets/holywings-logo.png',
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Container(
                margin: EdgeInsets.fromLTRB(18, 8, 18, 8),
                child: Text(
                  'Login to enjoy full experince, special made for Holy People!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(18, 8, 18, 8),
                child: Text(
                  'Input your phone number. We\'ll send you a verification code so we know that you\'re real.',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.fromLTRB(24, 4, 24, 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey[800],
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 6),
                      child: Image.asset(
                        'assets/indonesia.png',
                        width: 32,
                      ),
                    ),
                    Image.asset(
                      'assets/vertical-bar.png',
                      height: 22,
                      color: Colors.grey[500],
                    ),
                    Text('+62', style: TextStyle(fontSize: 14)),
                    SizedBox(width: 10),
                    Flexible(
                      child: TextFormField(
                        controller: textController,
                        maxLength: 9,
                        cursorColor: Colors.amber[300],
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        decoration: InputDecoration(
                          hintText: '8123xxxxx',
                          counterText: '',
                          border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Material(
                child: InkWell(
                  onTap: textInput >= 7 ? handleVerificationClick : null,
                  child: Container(
                    // margin: EdgeInsets.fromLTRB(18, 8, 18, 8),
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color:
                          textInput >= 7 ? Colors.orange[200] : Colors.black12,
                    ),
                    child: Center(
                      child: Text('Continue with phone number',
                          style: TextStyle(
                              color: textInput >= 7
                                  ? Colors.black
                                  : Colors.grey[400],
                              fontSize: 14)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
