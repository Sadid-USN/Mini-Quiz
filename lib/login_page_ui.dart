import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utilite/constants.dart';

class LoginScreenState extends StatefulWidget {
  @override
  _LoginScreenStateState createState() => _LoginScreenStateState();
}

class _LoginScreenStateState extends State<LoginScreenState> {
  bool _rememberMe = false;
  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter yuor Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter yuor Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildForgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: MaterialButton(
          padding: EdgeInsets.only(right: 0.0),
          onPressed: () => print('Forgot Password button Pressed'),
          child: Text(
            'Forgot Password?',
            style: kLabelStyle,
          )),
    );
  }

  Widget _buildRememberCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: [
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: _rememberMe,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value!;
                  });
                },
              )),
          Text(
            'Remember me',
            style: kLabelStyle,
          )
        ],
      ),
    );
  }

  Widget _buildLogin() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 25.0),
      child: MaterialButton(
        color: Colors.white,
        elevation: 5.0,
        onPressed: () => print('Login Button Pressed'),
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Text(
          'LOGIN',
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Color(0xFF527DAA)),
        ),
      ),
    );
  }

  Widget _buildSignWith() {
    return Column(
      children: [
        Text(
          '- OR -',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'Sign in with',
          style: kLabelStyle,
        )
      ],
    );
  }

  _buildSignUpWithSocialMedia() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => print('Login with Google'),
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    ),
                  ],
                  image:
                      DecorationImage(image: AssetImage('images/google.jpg'))),
            ),
          ),
          GestureDetector(
            onTap: () => print('Login with Facebook'),
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    ),
                  ],
                  image: DecorationImage(
                      image: AssetImage('images/facebook.jpg'))),
            ),
          ),
          GestureDetector(
            onTap: () => print('Login with Twitter'),
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    ),
                  ],
                  image: DecorationImage(
                      image: AssetImage('images/Twitter1.jpg'))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUp() {
    return GestureDetector(
      onTap: () => print('Sign Up Button Pressed'),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: 'Dont\'t have an Account? ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            )),
        TextSpan(
            text: 'Sign up',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
      ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap:() => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                        stops: [
                      0.1,
                      0.4,
                      0.7,
                      0.9
                    ]
                    
                    )),
              ),
              Container(
                // color: Colors.lime,
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 100.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          //fontFamily: 'OpenSans'
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildEmail(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildPassword(),
                      _buildForgotPassword(),
                      _buildRememberCheckbox(),
                      _buildLogin(),
                      _buildSignWith(),
                      _buildSignUpWithSocialMedia(),
                      _buildSignUp(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
