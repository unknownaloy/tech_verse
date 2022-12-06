import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 56.0,
          ),
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff7655D4),
                Color(0xff00CCE5),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "TECHVERSE",
                    style: GoogleFonts.ubuntu(
                      fontSize: 48.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    "Your one-stop to authentication",
                    style: GoogleFonts.ubuntu(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          // decoration: const InputDecoration(
                          //   hintText: 'Enter your email',
                          // ),
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "Email address",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        TextFormField(
                          // decoration: const InputDecoration(
                          //   hintText: 'Enter your email',
                          // ),
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "Full Name",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        TextFormField(
                          // decoration: const InputDecoration(
                          //   hintText: 'Enter your email',
                          // ),
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "Username",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        TextFormField(
                          // decoration: const InputDecoration(
                          //   hintText: 'Enter your email',
                          // ),
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "Password",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        TextFormField(
                          // decoration: const InputDecoration(
                          //   hintText: 'Enter your email',
                          // ),
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "Confirm Password",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xff2C64C6),
                            ),
                            minimumSize: MaterialStateProperty.all(
                              const Size.fromHeight(48.0),
                            ),
                            // side: MaterialStateProperty.all(BorderSide())
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Have an account? ",
                            style: GoogleFonts.ubuntu(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Login In',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // TODO: Handle sign up click
                                    },
                                  // style: GoogleFonts.ubuntu(
                                  //   fontSize: 16.0,
                                  //   color: Colors.white,
                                  //   fontWeight: FontWeight.w700,
                                  // ),
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "We need permission for the service you use",
                    style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Learn More",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontFamily: GoogleFonts.ubuntu().fontFamily,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
