import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thecoddingpapa_intagram/constants/size.dart';
import 'package:thecoddingpapa_intagram/main_page.dart';
import 'package:thecoddingpapa_intagram/utils/simple_snack_bar.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailConstroller = TextEditingController();
  TextEditingController _pwConstroller = TextEditingController();
  TextEditingController _cpwConstroller = TextEditingController();

  @override
  void dispose() {
    _emailConstroller.dispose();
    _pwConstroller.dispose();
    _cpwConstroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: common_l_gap,
                ),
                Image.asset("assets/insta_text_logo.png"),
                SizedBox(
                  height: common_xs_gap,
                ),
                TextFormField(
                  controller: _emailConstroller,
                  decoration: getTextFieldDecor('Email'),
                  validator: (String value) {
                    if (value.isEmpty || !value.contains("@")) {
                      return 'Please enter your email address!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: common_xs_gap,
                ),
                TextFormField(
                  controller: _pwConstroller,
                  decoration: getTextFieldDecor('Password'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter any password!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: common_xs_gap,
                ),
                TextFormField(
                  controller: _cpwConstroller,
                  decoration: getTextFieldDecor('Confirm Password'),
                  validator: (String value) {
                    if (value.isEmpty || value != _pwConstroller.text) {
                      return 'Password does not match!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: common_s_gap,
                ),
                FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _resister;
                    }
                  },
                  child: Text(
                    "Join",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  disabledColor: Colors.blue[100],
                ),
                SizedBox(
                  height: common_s_gap,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                        left: 0,
                        right: 0,
                        height: 1,
                        child: Container(
                          color: Colors.grey[300],
                          height: 1,
                        )),
                    Container(
                      height: 3,
                      width: 50,
                      color: Colors.grey[50],
                    ),
                    Text(
                      'OR',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: common_s_gap,
                ),
                FlatButton.icon(
                    textColor: Colors.blue,
                    onPressed: () {
                      simpleSnackbar(context, 'facebook pressed');
                    },
                    icon: ImageIcon(AssetImage("assets/icon/facebook.png")),
                    label: Text("Login with Facebook")),
                SizedBox(
                  height: common_s_gap,
                ),
                SizedBox(
                  height: common_l_gap,
                ),
              ],
            )),
      ),
    );
  }

  get _resister async {
    final AuthResult result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailConstroller.text, password: _pwConstroller.text) ;
    
    final FirebaseUser user = result.user ;
    if(user == null) {
      final snackBar = SnackBar(content: test('Please try again later!'));
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  InputDecoration getTextFieldDecor(String hint) {
    return InputDecoration(
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[300],
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[300],
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        fillColor: Colors.grey[100],
        filled: true);
  }
}
