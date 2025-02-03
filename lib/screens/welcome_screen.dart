import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_signup/screens/signin_screen.dart';
import 'package:login_signup/screens/signup_screen.dart';
import 'package:login_signup/theme/theme.dart';
import 'package:login_signup/widgets/custom_scaffold.dart';
import 'package:login_signup/widgets/welcome_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String displayedText = '';
  final String fullText = 'Welcome to CHATLY !';
  int index = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTypingAnimation();
  }

  void startTypingAnimation() {
    timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      if (index < fullText.length) {
        setState(() {
          displayedText += fullText[index];
          index++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 40.0,
              ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: displayedText.contains('CHATLY !') 
                          ? displayedText.substring(0, displayedText.indexOf('CHATLY !')) 
                          : displayedText,
                        style: const TextStyle(
                          fontSize: 39.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: displayedText.contains('CHATLY !') 
                          ? 'CHATLY !' 
                          : '',
                        style: const TextStyle(
                          fontSize: 39.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.yellow, // Highlight color for "Chatly"
                        ),
                      ),
                      TextSpan(
                        text: displayedText.contains('Chatly') 
                          ? displayedText.substring(displayedText.indexOf('Chatly') + 'Chatly'.length) 
                          : '',
                        style: const TextStyle(
                          fontSize: 39.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const TextSpan(
                        text: '\n where Connecting made simple, secure, and seamless.',
                        style: TextStyle(
                          fontSize: 20,
                          height: 1.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  const Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign in',
                      onTap: SignInScreen(),
                      color: Color.fromARGB(0, 10, 125, 171),
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign up',
                      onTap: const SignUpScreen(),
                      color: Colors.white,
                      textColor: lightColorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}