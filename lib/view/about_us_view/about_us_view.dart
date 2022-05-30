import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/png/about_us_background.png'),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.3,
              ),
              SizedBox(
                height: Get.height * 122 / Get.height,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset('assets/png/aboutus1.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset('assets/png/aboutus2.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset('assets/png/aboutus3.png'),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Text(
                  """The Book Grocer online offers a broad and ever increasing range of discounted remainder and secondhand books.

Our specialty is sourcing discounted books of amazing quality and passing on to our customers the best possible price.
We take our book buying very seriously indeed. We scour the globe and the best publishers and suppliers for the best bargains, but no book simply arrives in our warehouse simply because it's cheap. It has to be something we want to read ourselves and would reccomend to others.
We like to be known as the business which sells discounted books yet looks and feels like a retail bookstore.

We are an Australian, family-owned business. We have been buying and selling books since 2000, when the first Castlebooks store opened in Kingston, ACT.

In 2007 we opened the first Book Grocer in Brunswick, Victoria. Book Grocers can now be found in a range of locations across Victoria, NSW, and of course, Canberra.

Our staff also love reading and recommending books to others and we are proud of the role they play in demonstrating to our customers how good discount books can be.""",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15, color: Colors.black.withOpacity(0.75)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
