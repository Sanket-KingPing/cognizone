import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget myCarousel() {
  return const MyCarouselWidget();
}

class MyCarouselWidget extends StatefulWidget {
  const MyCarouselWidget({super.key});

  @override
  State<MyCarouselWidget> createState() => _MyCarouselWidgetState();
}

class _MyCarouselWidgetState extends State<MyCarouselWidget> {
  final CarouselSliderController _controller = CarouselSliderController();

  final List<Map<String, String>> _slides = [
    {
      'image': 'assets/images/student 1.jpg',
      'heading': 'Master New Skills',
      'text': 'Start your journey today',
    },
    {
      'image': 'assets/images/student 2.jpg',
      'heading': 'Industry Experts',
      'text': 'Learn from the best',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 237, 232, 232),
      ),
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          MouseRegion(
            onEnter: (_) => _controller.stopAutoPlay(),
            onExit: (_) => _controller.startAutoPlay(),
            child: CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                height: 350.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.85,
              ),
              items: _slides.map((slide) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // Background Image
                            Image.asset(
                              slide['image']!,
                              fit: BoxFit.cover,
                            ),
                            // Abstract Gradient Overlay
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft,
                                  colors: [
                                    Colors.indigo.withValues(alpha: 0.8),
                                    Colors.transparent,
                                    Colors.purple.withValues(alpha: 0.5),
                                  ],
                                ),
                              ),
                            ),
                            // Text Content
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    slide['heading']!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(0, 2),
                                          blurRadius: 4,
                                          color: Colors.black87,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    slide['text']!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(0, 1),
                                          blurRadius: 3,
                                          color: Colors.black87,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          // Navigation Arrows
          Positioned(
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new,
                    color: Colors.white, size: 20),
                onPressed: () => _controller.previousPage(),
              ),
            ),
          ),
          Positioned(
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_ios,
                    color: Colors.white, size: 20),
                onPressed: () => _controller.nextPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
