


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_2/app/pages/characters/characters_page.dart';
import 'package:task_2/app/pages/episodes/episodes_page.dart';
import 'package:task_2/app/pages/home/bloc/home_bloc.dart';
import 'package:task_2/app/pages/home/bloc/home_state.dart';
import 'package:task_2/app/pages/home/widgets/carousel.dart';
import 'package:task_2/app/pages/home/widgets/characterCard.dart';
import 'package:task_2/app/pages/home/widgets/episodeCard.dart';



class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.transparent,
            body: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                    return CustomScrollView(
                                slivers: [
                                    
                                    SliverPadding(padding: EdgeInsets.only(top:  20.h)),
                                   
                                    SliverToBoxAdapter(
                                        child: Padding(
                                            padding: EdgeInsets.all(20.w),
                                            child: Container(
                                                alignment: Alignment.center,
                                                child: Text("Rick and Morty", style: TextStyle(color: Colors.white, fontFamily: "Devonshire", fontWeight: FontWeight.bold, fontSize: 40.sp)),
                                            ),
                                        ),
                                    ),
                                   
                                      SliverToBoxAdapter(
                                        child: RickAndMortyCarousel()
                                    ),
                                    SliverToBoxAdapter(
                                        child: Padding(
                                            padding: EdgeInsets.all(20.w),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Characters", style: TextStyle(fontSize: 20.sp, fontFamily: "Poppins", fontWeight: FontWeight.w700, color: Colors.white)),
                                                TextButton( 
                                                    onPressed: (){
                                                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CharactersPage()));
                                                    },  
                                                    child: Text("see all", style: TextStyle(fontSize: 14.sp, fontFamily: "Poppins", color: Colors.white))
                                                ),
                                              ],
                                            ),
                                        ),
                                    ),
                                    SliverToBoxAdapter(
                                            child: SizedBox(
                                            height: 130.h, 
                                            width: 0.3.sw,// yoki kerakli balandlik
                                            child: ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                itemCount: state.characterList.length > 10 ? 10 : state.characterList.length,
                                                itemBuilder: (context, index) {
                                                    return Padding(
                                                        padding: EdgeInsets.only(left: 20.w, right: index == 9 ? 20.w : 0),
                                                        child: CharacterCard(character: state.characterList[index], key: ValueKey(state.characterList[index].id)),
                                                    );
                                                },
                                            ),
                                            ),
                                        ),
                                    SliverToBoxAdapter(
                                        child: Padding(
                                            padding: EdgeInsets.all(20.w),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Episodes", style: TextStyle(fontSize: 20.sp, fontFamily: "Poppins", fontWeight: FontWeight.w700, color: Colors.white)),
                                                TextButton( 
                                                    onPressed: (){
                                                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => EpisodesPage()));
                                                    },  
                                                    child: Text("see all", style: TextStyle(fontSize: 14.sp, fontFamily: "Poppins", color: Colors.white))
                                                ),
                                              ],
                                            ),
                                        ),
                                    ),
                                    SliverToBoxAdapter(
                                            child: SizedBox(
                                            height: 130.h, 
                                            child: ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                itemCount: state.episodeList.length > 10 ? 10 : state.characterList.length,
                                                itemBuilder: (context, index) {
                                                return Padding(
                                                    padding: EdgeInsets.only(left: 20.w,right: index == 9 ? 20.w : 0), 
                                                    child: Episodecard(episode: state.episodeList[index]),
                                                );
                                                },
                                            ),
                                            ),
                                        ),

                                    SliverPadding(padding: EdgeInsets.only(top:  50.h)),
                                ],
                    );
                }
            ),
        );
    }
}
