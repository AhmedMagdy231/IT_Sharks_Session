import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_4/data/database.dart';
import 'package:session_4/data/node.dart';



part 'app_state.dart';

class AppCubit extends Cubit<AppState> {

  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);
  List<Note> myNotes =[];

  Future<void> getData()async{
    emit(GetDataLoading());
    myNotes = [];

     MyDatabase.getAllDate().then((value){

      value.forEach((element) {
        Note note = Note.fromMap(element);
        myNotes.add(note);

      });
      emit(GetDataSuccess());
    }).catchError((error){
      print(error.toString());
      emit(GetDataError());
    });



  }

  void changeFinish({required bool value,required int index}){
    myNotes[index].finish = ! myNotes[index].finish!;
    MyDatabase.updateDatabase(
      title: myNotes[index].title!,
      des:   myNotes[index].description!,
      date:  myNotes[index].date!,
      time:  myNotes[index].time!,
      id:    myNotes[index].id!,
      finish: myNotes[index].finish!? 1 : 0,
    );
    emit(ChangeFinish());

  }


  void insertNewNote({required title,required des,required date, required time})async{

   await MyDatabase.insertToDatabase(
        title: title,
        des: des,
        date: date,
        time: time,
        finish: 0,
    ).then((value){
      getData();
    });


  }


}
