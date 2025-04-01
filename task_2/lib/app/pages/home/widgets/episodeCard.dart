import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_2/app/model/episodeModel.dart';

class Episodecard extends StatelessWidget {
    final Episodemodel episode;
    
    const Episodecard({super.key, required this.episode});

    @override
    Widget build(BuildContext context) {
        String season = episode.episode.substring(2, 3);

        return 
                GestureDetector(
                onTap: () {
                },
                child: Column(
                    children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                      child: Stack(
                        children: [
                           Positioned.fill(
                          child: Image.asset(
                              "assets/images/Rick_and_Morty_season_$season.png",
                              fit: BoxFit.cover,
                          ),
                          ),
                          Container(
                              height: 110.h,
                              width: 110.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.black.withOpacity(0.0), Colors.black.withOpacity(0.7)],
                                  ),
                                  borderRadius: BorderRadius.circular(15.r)),
                              child: Text(
                              episode.name.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp),
                              textAlign: TextAlign.center,
                              ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                        episode.episode.toString(),
                        style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        ),
                    ),
                    ],
                ),
        );
  }
}
