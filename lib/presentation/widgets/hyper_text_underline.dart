import 'package:birthday_app/common/palette.dart';
import 'package:birthday_app/common/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HyperTextUnderline extends StatelessWidget {
  const HyperTextUnderline({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(
        Uri.parse(url),
      ),
      child: RichText(
        text: TextSpan(
          text: Strings.url,
          style: GoogleFonts.jost(
              decoration: TextDecoration.underline,
              color: Palette.grey,
              fontSize: 14.sp),
        ),
      ),
    );
  }
}
