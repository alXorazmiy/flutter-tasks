import 'package:bloc/bloc.dart';
import 'package:task_2/app/pages/detail/bloc/detail_event.dart';
import 'package:task_2/app/pages/detail/bloc/detail_state.dart';



class DetailBloc extends Bloc<DetailEvent, DetailState> {
    DetailBloc() : super(DetailState()) {
        
    }
}
