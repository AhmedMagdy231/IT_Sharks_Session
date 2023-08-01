import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  //return instance of cubit
  static CounterCubit get(context)=>BlocProvider.of(context);

  int counter = 0;

  void incrementCounter(){
    emit(CounterLoading());
    counter++;
    emit(CounterIncremented());
  }

  void decrementCounter(){
    counter--;
    emit(CounterDecremented());
  }


}
