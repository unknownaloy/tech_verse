import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_verse/enums/request_state.dart';
import 'package:tech_verse/features/authentication/common/auth_validator.dart';
import 'package:tech_verse/features/authentication/signup/view_model/sign_up_view_model.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailTextController;
  late final TextEditingController _fullNameTextController;
  late final TextEditingController _usernameTextController;
  late final TextEditingController _passwordTextController;
  late final TextEditingController _confirmPasswordTextController;

  @override
  void initState() {
    super.initState();

    _emailTextController = TextEditingController();
    _fullNameTextController = TextEditingController();
    _usernameTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _confirmPasswordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _fullNameTextController.dispose();
    _usernameTextController.dispose();
    _passwordTextController.dispose();
    _confirmPasswordTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(signUpViewModel).maybeWhen(
          loading: () => true,
          orElse: () => false,
        );
    ref.listen<RequestState>(signUpViewModel, (previous, next) {
      if (next == const RequestState.success()) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const AuthValidator(),
          ),
          (route) => false,
        );
      }
      if (next == const RequestState.error()) {
        final errorMessage = ref.read(signUpViewModel.notifier).errorMessage;

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
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "TECHVERSE",
                              style: GoogleFonts.ubuntu(
                                fontSize: 32.0,
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
                                    controller: _emailTextController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "Email address",
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
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
                                    height: 16.0,
                                  ),
                                  TextFormField(
                                    controller: _fullNameTextController,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "Full Name",
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                    ),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Full name is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 16.0,
                                  ),
                                  TextFormField(
                                    controller: _usernameTextController,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "Username",
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                    ),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Username is required';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 16.0,
                                  ),
                                  TextFormField(
                                    controller: _passwordTextController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "Password",
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
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
                                    height: 16.0,
                                  ),
                                  TextFormField(
                                    controller: _confirmPasswordTextController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "Confirm Password",
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                    ),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter password';
                                      }

                                      if (_passwordTextController.text.trim() !=
                                          value.trim()) {
                                        return "Password does not match";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 24.0,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        final model =
                                            ref.read(signUpViewModel.notifier);

                                        model.signUp(
                                          email:
                                              _emailTextController.text.trim(),
                                          password: _passwordTextController.text
                                              .trim(),
                                          fullName: _fullNameTextController.text
                                              .trim(),
                                          username: _usernameTextController.text
                                              .trim(),
                                        );
                                      }
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        const Color(0xff2C64C6),
                                      ),
                                      minimumSize: MaterialStateProperty.all(
                                        const Size.fromHeight(48.0),
                                      ),
                                      // side: MaterialStateProperty.all(BorderSide())
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                    ),
                                    child: isLoading
                                        ? const CircularProgressIndicator(
                                            strokeWidth: 2.0,
                                            color: Colors.white,
                                          )
                                        : Text(
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
                                                Navigator.pop(context);
                                              },
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontFamily: GoogleFonts.ubuntu()
                                                  .fontFamily,
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
            },
          ),
        ),
      ),
    );
  }
}
