import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'ติดต่อเรา',
                style: GoogleFonts.prompt(fontSize: 40.0),
              ),
            ),
            Container(width: 20, height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/icon_fb.png',
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    '    PTT Station',
                    style: GoogleFonts.prompt(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            //Container(width: 20, height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/icon_line.png',
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    '    OR Happy Life',
                    style: GoogleFonts.prompt(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            //Container(width: 20, height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/icon_tw.png',
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    '    @pttplc_official',
                    style: GoogleFonts.prompt(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
