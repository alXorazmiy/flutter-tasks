



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_2/app/pages/characters/widgets/characterGridCard.dart';
import 'package:task_2/app/pages/episodes/widgets/episodesGridCard.dart';
import 'package:task_2/app/pages/home/bloc/home_bloc.dart';
import 'package:task_2/app/pages/home/bloc/home_event.dart';
import 'package:task_2/app/pages/home/bloc/home_state.dart';


class EpisodesPage extends StatefulWidget {
  const EpisodesPage({super.key});

  @override
  State<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
     late ScrollController _scrollController;

    @override
    void initState() {
        super.initState();
        _scrollController = ScrollController();
        _scrollController.addListener(_scrollListener);
    }

    @override
    void dispose() {
        _scrollController.dispose();
        super.dispose();
    }


    void _scrollListener() {
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
            context.read<HomeBloc>().add(LoadMoreEpisodesEvent());
        }
    }
  @override
   Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Color(0xff1d2130),
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                title: Text("Episodes", style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 20.sp),),
                centerTitle: true,
                leading: Padding(
                  padding:  EdgeInsets.only(left: 10.w),
                  child: IconButton(  onPressed: () {Navigator.pop(context);},icon : Icon(Icons.arrow_back_ios, color: Colors.white,)),
                ),
            ),
            body: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                    return CustomScrollView(
                        controller: _scrollController,
                                slivers: [
                                SliverPadding(padding: EdgeInsets.only(top:  20.h)),    
                                SliverPadding(
                                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                                        sliver: SliverGrid(
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 10.w,
                                                crossAxisSpacing: 15.w,
                                                childAspectRatio: 0.75,
                                            ),
                                            delegate: SliverChildBuilderDelegate(
                                                childCount: state.episodeList.length,
                                                (BuildContext context, int index) {
                                                    return 
                                                        Episodesgridcard(episode: state.episodeList[index], key: ValueKey(state.episodeList[index].id) );
                                                
                                                },
                                            ),
                                        ),

                                    ),
                                    if (state.episodeList.isNotEmpty && state.episodeNextPageUrl != null)
                                        SliverToBoxAdapter(
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: 20.h),
                                            child: Center(child: CircularProgressIndicator()),
                                        ),
                                    ),
                        
                                ],
                    );
                }
            ),
        );
    }
}

