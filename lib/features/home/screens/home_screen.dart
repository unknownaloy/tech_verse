import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_verse/features/authentication/common/auth_view_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    height: 72.0,
                  ),
                  const Icon(
                    Icons.lock,
                    size: 80.0,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    "Use your unique code or setup key to verify account",
                    style: GoogleFonts.ubuntu(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 64.0,
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
                    child: Stack(
                      children: [
                        const Positioned(
                          left: 24.0,
                          child: Icon(
                            Icons.camera_alt_outlined,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Scan a unique code",
                            style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
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
                    child: Stack(
                      children: [
                        const Positioned(
                          left: 24.0,
                          child: Icon(
                            Icons.desktop_mac,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Enter a setup key",
                            style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Import existing account?",
                      style: GoogleFonts.ubuntu(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ref.read(authViewModel.notifier).signOut();
                    },
                    child: Text(
                      "Sign out",
                      style: GoogleFonts.ubuntu(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
