import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingAuthScreen extends StatefulWidget {
  const OnboardingAuthScreen({super.key});

  @override
  State<OnboardingAuthScreen> createState() => _OnboardingAuthScreenState();
}

class _OnboardingAuthScreenState extends State<OnboardingAuthScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final titles = [
    "Effortless Resume",
    "Smart Networking",
    "NoCode Biopage",
    "Flexible Templates",
    "Flexible Templates",
    "Connect Right Jobs",
    "Mentor Guidance"
  ];

  final images = [
    "assets/onboard/onboard_1.svg",
    "assets/onboard/onboard_2.svg",
    "assets/onboard/onboard_3.svg",
    "assets/onboard/onboard_4.svg",
    "assets/onboard/onboard_5.svg",
    "assets/onboard/onboard_6.svg"
  ];

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F9),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: h * 0.01),
            // Logo
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/logo/logo.png',
                  height: 28,
                ),
              ),
            ),

            // Slider
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: PageView.builder(
                controller: _pageController,
                itemCount: images.length,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: h * 0.25,
                        child: SvgPicture.asset(
                          images[index],
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      SizedBox(height: h * 0.015),
                      Text(
                        titles[index],
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentIndex == index ? 10 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? Colors.black
                        : Colors.black26,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),


            // White breathing space
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            // Bottom Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Color(0xFF041C3F),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  _inputField(),
                  SizedBox(height: h * 0.02),
                  _startButton(),
                  SizedBox(height: h * 0.2),
                  _loginRegisterSwitch(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Enter Email Address",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _startButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2563EB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text("Start With Login", style: TextStyle(color: Colors.white),),
      ),
    );
  }

  Widget _loginRegisterSwitch() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Color(0xFF041C3F),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text("Registration", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
