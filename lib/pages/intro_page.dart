import 'package:flutter/material.dart';
import 'package:pdpui_intro/utils/strings.dart';

import 'home_page.dart';

class IntroPage extends StatefulWidget {
  static const String id = 'intro_page';
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController? _pageController;
  int currentIndex = 0;

  @override
  initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // #pageView
          PageView(
            onPageChanged: (int pageIndex) {
              setState(() {
                currentIndex = pageIndex;
              });
            },
            controller: _pageController,
            children: [
              makePage('assets/images/image_1.png', Strings.stepOneTitle, Strings.stepOneContent),
              makePage('assets/images/image_2.png', Strings.stepTwoTitle, Strings.stepTwoContent),
              makePage('assets/images/image_3.png', Strings.stepThreeTitle, Strings.stepThreeContent),
            ],
          ),

          // #indicators
          Container(
            margin: const EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicators(),
            ),
          ),

          // #skip
          currentIndex == 2
              ? Positioned(
                  right: 0,
                  bottom: 60,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Skip',
                        style: TextStyle(color: Color(0xffDB493C), fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget makePage(image, title, content) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const SizedBox(height: 30),
              Text(
                title,
                style: const TextStyle(color: Color(0xffDB493C), fontSize: 30),
              ),
              const SizedBox(height: 30),
              Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: const Color(0xffDB493C),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicators() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      indicators.add(_indicator(currentIndex == i));
    }
    return indicators;
  }
}
