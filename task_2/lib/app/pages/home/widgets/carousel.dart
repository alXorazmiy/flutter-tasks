import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_2/app/pages/home/bloc/home_bloc.dart';
import 'package:task_2/app/pages/home/bloc/home_state.dart';

class RickAndMortyCarousel extends StatefulWidget {
  @override
  _RickAndMortyCarouselState createState() => _RickAndMortyCarouselState();
}

class _RickAndMortyCarouselState extends State<RickAndMortyCarousel> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.seasonList.isEmpty) {
          return Center(child: CircularProgressIndicator()); 
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              carouselController: _controller,
              options: CarouselOptions(
                height: 160.h,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayInterval: Duration(seconds: 3),
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              itemCount: state.seasonList.length,
              itemBuilder: (context, index, realIndex) {
                final season = state.seasonList[index];
                return Container(
                  width: 0.8.sw,
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 8.r)],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          "assets/images/${season.image}",
                          fit: BoxFit.cover,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black.withOpacity(0.0), Colors.black.withOpacity(0.7)],
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                season.name,
                                style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold,fontFamily: "Poppins"),
                              ),
                              Text(
                                "${season.episodes} episodes",
                                style: TextStyle(color: Colors.white70, fontSize: 16.sp, fontFamily: "Poppins"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 20.h),

            // ** Dots Indicator **
            AnimatedSmoothIndicator(
              activeIndex: _currentIndex,
              count: state.seasonList.length,
              effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: Colors.grey,
                dotColor: Color(0xff3a495d),
              ),
              onDotClicked: (index) {
                _controller.animateToPage(index);
              },
            ),
          ],
        );
      },
    );
  }
}
