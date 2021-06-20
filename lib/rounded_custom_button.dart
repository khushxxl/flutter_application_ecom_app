import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class RoundedCustomButton extends StatelessWidget {
  final String text;

  const RoundedCustomButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
        color: Colors.orange,
      ),
      child: Text(
        text,
        // style: GoogleFonts.montserrat(
        //   fontSize: 20.0,
        //   fontWeight: FontWeight.w500,
        // ),
      ),
    );
  }
}
