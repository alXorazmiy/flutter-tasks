


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_2/app/pages/home/bloc/home_bloc.dart';
import 'package:task_2/app/pages/home/bloc/home_state.dart';
import 'package:task_2/app/pages/home/widgets/carousel.dart';
import 'package:task_2/app/pages/home/widgets/characterCard.dart';



class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    TextEditingController _searchController = TextEditingController();
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
                                   
                                    // SliverToBoxAdapter(
                                    //     child: Padding(
                                    //         padding: EdgeInsets.all(20.w),
                                    //         child: Container(
                                    //             padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.w),
                                    //             decoration: BoxDecoration(
                                    //                 // color: Color.fromRGBO(255, 255, 255, 0.2),
                                    //                 color: Color(0xff3a495d),
                                    //                 borderRadius: BorderRadius.circular(8.r)
                                    //             ),
                                    //             child: Row(
                                    //                 children: [
                                    //                     SizedBox(
                                    //                         height: 16.w,
                                    //                         width: 16.w,
                                    //                         child: Image.asset("assets/icons/search.png", color: Colors.white,),
                                    //                     ),
                                    //                     SizedBox(width: 10.w),
                                    //                     Expanded(
                                    //                         child: TextField(
                                    //                             controller: _searchController,
                                    //                             decoration: InputDecoration(
                                    //                                 hintText: "Search",
                                    //                                 hintStyle: TextStyle(color: Colors.white),
                                    //                                 border: InputBorder.none,
                                                                    
                                    //                             ),
                                    //                         ),
                                    //                     )

                                    //                 ],
                                    //             ),
                                    //         ),
                                    //     ),
                                    // ),
                                      SliverToBoxAdapter(
                                        child: RickAndMortyCarousel()
                                    ),
                                    SliverToBoxAdapter(
                                        child: Padding(
                                            padding: EdgeInsets.all(20.w),
                                            child: Text("Characters", style: TextStyle(fontSize: 20.sp, fontFamily: "Poppins", fontWeight: FontWeight.w700, color: Colors.white)),
                                        ),
                                    ),
                                    SliverPadding(
                                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                                        sliver: SliverGrid(
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 10.w,
                                                crossAxisSpacing: 15.w,
                                                childAspectRatio: 0.75,
                                            ),
                                            delegate: SliverChildBuilderDelegate(
                                                childCount: state.characterList.length,
                                                (BuildContext context, int index) {
                                                    return 
                                                        CharacterGridCard(character: state.characterList[index], key: ValueKey(state.characterList[index].id) );
                                                
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
