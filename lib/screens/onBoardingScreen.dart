import 'package:flutter/material.dart';
import 'package:lanceme_ui_project/common_widgets/custom_button.dart';
import 'package:lanceme_ui_project/screens/loginScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:lanceme_ui_project/constants/constants.dart';
import 'package:lanceme_ui_project/screens/splash_screen.dart';

const _noOfBoardingPages = 4;

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Constants.mainbackgroundColor,
      body: SafeArea(
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 3;
            });
          },
          controller: _pageController,
          children: [
            OnBoardContent(size: size),
            OnBoardContent(size: size),
            OnBoardContent(size: size),
            OnBoardContent(size: size),
          ],
        ),
      ),
      bottomSheet: CustomButtomSheet(
        size: size,
        pageController: _pageController,
        isLastPage: isLastPage,
      ),
    );
  }
}

class CustomButtomSheet extends StatelessWidget {
  const CustomButtomSheet(
      {super.key,
      required this.size,
      required PageController pageController,
      required this.isLastPage})
      : _pageController = pageController;

  final Size size;
  final PageController _pageController;
  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: size.height * 0.40,
        decoration: BoxDecoration(
            color: Constants.whiteColor,
            border: Border(
                top: BorderSide(
              color: customGreyColor.shade200,
            ))),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "What is Lanceme Up?",
                style: TextStyle(
                    color: Constants.brandSecondaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                style: TextStyle(fontSize: 16),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 32),
                  child: SmoothPageIndicator(
                      effect: const ExpandingDotsEffect(
                          activeDotColor: Constants.brandMainColor),
                      controller: _pageController,
                      count: _noOfBoardingPages)),
              isLastPage
                  ? CustomTextButton(
                      size: size,
                      title: "Get Started",
                      onPressed: () {
                        //last page ho vaney got to login screen

                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginIn(),
                            ),
                            (route) => false);
                      },
                    )
                  : CustomTextButton(
                      size: size,
                      title: "Next",
                      onPressed: () {
                        //go to next onBoarding screen
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      }),
              const SizedBox(
                height: 10,
              ),
              isLastPage
                  ? Container()
                  : Center(
                      child: TextButton(
                          onPressed: () {
                            //go to last page
                            _pageController.jumpToPage(3);
                          },
                          child: const Text(
                            "Skip",
                            style: TextStyle(color: Constants.brandMainColor),
                          )),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 43, vertical: size.height * 0.1),
      decoration: BoxDecoration(
          color: customGreyColor.shade200,
          borderRadius: BorderRadius.circular(24)),
    );
  }
}
