import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen03 extends StatelessWidget {
  const Screen03({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff7655d4),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 56.0,
              left: 24.0,
              right: 24.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 96.0,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Icon(
                      Icons.code_off_outlined,
                      size: 64.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 128.0,
                ),
                Text(
                  "Unique Code",
                  style: GoogleFonts.ubuntu(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                Text(
                  "Enter your password and verify with a code from the app",
                  style: GoogleFonts.ubuntu(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 24.0,
            left: 0,
            right: 24.0,
            child: SizedBox(
              height: 112.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Color(0xffCECECE),
                      ),
                      SizedBox(
                        width: 32.0,
                      ),
                      CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Color(0xffCECECE),
                      ),
                      SizedBox(
                        width: 32.0,
                      ),
                      CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "FINISH",
                          style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                      ],
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
