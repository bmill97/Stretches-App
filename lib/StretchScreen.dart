import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'Stretch.dart';
import 'package:url_launcher/url_launcher.dart';

class StretchScreen extends StatefulWidget {
  final Stretch stretch;

  const StretchScreen(this.stretch, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _StretchScreenState();
  }
}

class _StretchScreenState extends State<StretchScreen> {
  late Stretch stretch = widget.stretch;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Stretches"),
          backgroundColor: const Color(0xff5e6572),
          centerTitle: true,
        ),
        body: Container(
            color: const Color(0xFFEEF1EF),
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                      stretch.getName(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 45),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 4,
                ),
                RichText(
                    text: TextSpan(
                        children: [
                          const TextSpan(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20
                              ),
                              text: "For a video of this "
                          ),
                          TextSpan(
                              style: const TextStyle(
                                  color: Color(0xffA9B4C2),
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2,
                                  fontSize: 20
                              ),
                              text: "click here",
                              recognizer: TapGestureRecognizer()..onTap =  () async{
                                var url = stretch.getLink();
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              }
                          ),
                        ]
                    )),
                const Divider(
                  color: Colors.black,
                  thickness: 4,
                ),
                const Text(
                    "How to do the stretch",
                    style: TextStyle(fontSize: 20)
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                ),
                Text(
                    stretch.getInstructions(),
                    style: const TextStyle(fontSize: 20)
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                ),
              ],
            )));
  }
}
