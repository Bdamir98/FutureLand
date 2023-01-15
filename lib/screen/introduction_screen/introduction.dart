import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_land/screen/drawer_item_page/home_page/home_page.dart';
import 'package:introduction_slider/introduction_slider.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionSlider(
        items: [
          IntroductionSliderItem(
            logo: Image.asset(
              'assets/page2.jpg',
              height: 350,
              width: 300,
            ),
            backgroundColor: Color(0xffFFFFFF),
            title: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff204385)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to FutureLand',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Find the ideal place\n according to your needs and\n expectations with secure system.',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          IntroductionSliderItem(
            logo: Image.asset(
              'assets/page1.jpg',
              height: 350,
              width: 300,
            ),
            backgroundColor: Color(0xffFFFFFF),
            title: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff204385)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Virtual Agent',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Your virtual broker \nautomatically serach land for you\n without any 3rd party broker.',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          IntroductionSliderItem(
            logo: Image.asset(
              'assets/page3.jpg',
              height: 350,
              width: 300,
            ),
            backgroundColor: Color(0xffFFFFFF),
            title: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff204385)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Buy and Sell Land',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Safely Buy and Sell your \nLand with full secure system.',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
        done: Done(
          child: Icon(
            Icons.done,
            color: Colors.white,
          ),
          home: HomePage(),
        ),
        next: Next(
            child: Icon(
          Icons.arrow_forward,
          color: Colors.yellow,
          // color: Color(0xff00BD9F),
        )),
        back: Back(
            child: Icon(
          Icons.arrow_back,
          color: Colors.yellow,
        )),
        dotIndicator: DotIndicator(
          selectedColor: Colors.white,
        ),
      ),
    );
  }
}
