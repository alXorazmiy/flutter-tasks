



import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_2/app/model/characterModel.dart';
import 'package:task_2/app/pages/detail/detail_page.dart';

class Charactergridcard extends StatelessWidget {
    final CharacterModel character;
    const Charactergridcard({super.key, required this.character});

    @override
    Widget build(BuildContext context) {
        return Stack(
            children: [
                GestureDetector(
                            onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CharacterDetailPage(character: character)));
                            },
                            child: Container(
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Column(
                                    children: [
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(15.r),
                                            child: CachedNetworkImage(
                                                height: 130.h,
                                                imageUrl: character.imageUrl.toString(),
                                                placeholder: (context, url) => SizedBox(),
                                                errorWidget: (context, url, error) => Icon(Icons.error),
                                            ),
                                        ),
                                        SizedBox(height: 5.h,),
                                        Text(
                                            character.name.toString(),
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.sp,
                                                color: Colors.white
                                            ),
                                            textAlign: TextAlign.center,
                                        ),
                                        
                                    ],
                                ),
                            ),
                        ),
                        Positioned(
                            top: 5.h,
                            right: 5.h,
                            child: character.status == "Alive"  
                                ?  Container(
                                        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.w),
                                        decoration: BoxDecoration(
                                            color: Color(0xff1b9c85),
                                            borderRadius: BorderRadius.circular(6.r)
                                        ),
                                        child: Text(character.status.toString(), style: TextStyle(color: Colors.white,fontFamily: "Poppins")),
                                    )
                                : character.status == "Dead" 
                                   ? Container(
                                        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.w),
                                        decoration: BoxDecoration(
                                            color: Color(0xffff0060),
                                            borderRadius: BorderRadius.circular(6.r)
                                        ),
                                        child: Text(character.status.toString(), style: TextStyle(color: Colors.white, fontFamily: "Poppins")),
                                    ) 
                                   : SizedBox()
                        )
            ],
        );
    }
}