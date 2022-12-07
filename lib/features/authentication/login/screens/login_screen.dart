import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_verse/enums/request_state.dart';
import 'package:tech_verse/features/authentication/login/view_model/login_view_model.dart';
import 'package:tech_verse/screens/sign_up_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailTextController;
  late final TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();

    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<RequestState>(loginViewModel, (previous, next) {
      if (next == const RequestState.error()) {
        final errorMessage = ref.read(loginViewModel.notifier).errorMessage;

        if (errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
            ),
          );
        }
      }
    });
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
              Text(
                "TECHVERSE",
                style: GoogleFonts.ubuntu(
                  fontSize: 48.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),

              // Input section
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }

                        final RegExp emailRegExp = RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
                        );

                        if (!emailRegExp.hasMatch(value.trim())) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final model = ref.read(loginViewModel.notifier);

                          model.login(
                            email: _emailTextController.text.trim(),
                            password: _passwordTextController.text.trim(),
                          );
                        }
                      },
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
                      child: ref.watch(loginViewModel).when(
                            idle: () => Text(
                              "Log In",
                              style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                            loading: () => const CircularProgressIndicator(
                              strokeWidth: 2.0,
                              color: Colors.white,
                            ),
                            success: () => Text(
                              "Log In",
                              style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                            error: (error) => Text(
                              "Log In",
                              style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 16.0,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: GoogleFonts.ubuntu(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign Up',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                      style: GoogleFonts.ubuntu(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
