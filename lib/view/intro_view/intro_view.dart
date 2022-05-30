import 'package:booker/consts.dart';
import 'package:booker/view/intro_view/First_intro.dart';
import 'package:booker/view/intro_view/fourth_intro.dart';
import 'package:booker/view/intro_view/sec_intro.dart';
import 'package:booker/view/intro_view/third_intro.dart';
import 'package:flutter/material.dart';

class IntroView extends StatefulWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  PageController _controller = PageController(
    initialPage: 0,
  );
  int page = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: PageView(
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  page = value;
                });
              },
              children: const [
                FirstIntro(),
                SecIntro(),
                ThirdIntro(),
                FourthIntro()
              ],
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 80),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AnimatedContainer(
                    height: 20,
                    width: 20,
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: page == 0
                          ? primaryColor
                          : primaryColor.withOpacity(0.25),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AnimatedContainer(
                    height: 20,
                    width: 20,
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: page == 1
                          ? primaryColor
                          : primaryColor.withOpacity(0.25),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AnimatedContainer(
                    height: 20,
                    width: 20,
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: page == 2
                          ? primaryColor
                          : primaryColor.withOpacity(0.25),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AnimatedContainer(
                    height: 20,
                    width: 20,
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: page == 3
                          ? primaryColor
                          : primaryColor.withOpacity(0.25),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
