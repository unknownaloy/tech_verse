import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen01 extends StatelessWidget {
  const Screen01({Key? key}) : super(key: key);

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
              children: [
                Image.asset("assets/images/onboarding_01.png"),
                const SizedBox(
                  height: 40.0,
                ),
                Text(
                  "Protect Your Account",
                  style: GoogleFonts.roboto(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                Text(
                  "Get verification codes for all your accounts using multi-factor verification",
                  style: GoogleFonts.roboto(
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
                        backgroundColor: Colors.white,
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
                        backgroundColor: Color(0xffCECECE),
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
                          "Skip",
                          style: GoogleFonts.roboto(
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
