import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_2/app/model/characterModel.dart';
import 'package:task_2/app/pages/home/bloc/home_bloc.dart';
import 'package:task_2/app/pages/home/bloc/home_event.dart';
import 'package:task_2/app/pages/home/bloc/home_state.dart';
import 'package:task_2/app/pages/home/widgets/episodeCard.dart';

class CharacterDetailPage extends StatefulWidget {
    final CharacterModel character;
    const CharacterDetailPage({super.key, required this.character});

    @override
    State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {

    @override
    void initState() {
        super.initState();
        context.read<HomeBloc>().add(LoadCharacterEpisodesEvent(episode: widget.character.episodes));
    }


    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Color(0xff1d2130),
            body: Column(
                children: [
                    SizedBox(
                        width: 1.sw,
                        height: 1.sw,
                        child: CachedNetworkImage(
                            imageUrl: widget.character.imageUrl.toString(),
                            fit: BoxFit.cover,
                            placeholder: (context, url) => SizedBox(),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                        widget.character.name.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                        ),
                        textAlign: TextAlign.center,
                    ),
                    Padding(
                        padding: EdgeInsets.all(20.w),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                widget.character.status == "Alive"
                                    ? Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w,
                                            vertical: 2.w,
                                        ),
                                        decoration: BoxDecoration(
                                            color: Color(0xff1b9c85),
                                            borderRadius: BorderRadius.circular(6.r),
                                        ),
                                        child: Text(
                                            widget.character.status.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Poppins",
                                            ),
                                        ),
                                    )
                                    : widget.character.status == "Dead"
                                        ? Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4.w,
                                                vertical: 2.w,
                                            ),
                                            decoration: BoxDecoration(
                                                color: Color(0xffff0060),
                                                borderRadius: BorderRadius.circular(6.r),
                                            ),
                                            child: Text(
                                                widget.character.status.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Poppins",
                                                ),
                                            ),
                                        )
                                        : SizedBox(),
                                widget.character.gender == "Male"
                                    ? Row(
                                        children: [
                                            SizedBox(
                                                height: 20.w,
                                                width: 20.w,
                                                child: Image.asset("assets/icons/male.png"),
                                            ),
                                            SizedBox(width: 10.w),
                                            Text(
                                                widget.character.gender.toString(),
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    color: Colors.white,
                                                ),
                                            ),
                                        ],
                                    )
                                    : widget.character.gender == "Female"
                                        ? Row(
                                            children: [
                                                SizedBox(
                                                    height: 20.w,
                                                    width: 20.w,
                                                    child: Image.asset("assets/icons/female.png"),
                                                ),
                                                SizedBox(width: 10.w),
                                                Text(
                                                    widget.character.gender.toString(),
                                                    style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        color: Colors.white,
                                                    ),
                                                ),
                                            ],
                                        )
                                        : SizedBox(),
                            ],
                        ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(20.w),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                                Text(
                                    "Episodes",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                    ),
                                ),
                            ],
                        ),
                    ),
                    BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                            
                            return SizedBox(
                            height: 130.h,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.characterEpisodeList.length, 
                                itemBuilder: (context, index) {
                                return Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.w,
                                        right: index == state.characterEpisodeList.length - 1 ? 20.w : 0,
                                    ),
                                    child: Episodecard(
                                        episode: state.characterEpisodeList[index],
                                    ),
                                );
                                },
                            ),
                            );
                        },
                    )
                    
                ],
            ),
        );
    }
}
