import 'package:bloc/bloc.dart';
import 'package:diet_chaiyoo/features/home/presentation/view_model/home_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  void onTabTapped(int index){
    emit(state.copyWith(selectedIndex:index));
  }

  // void logout(BuildContext context){
  //   Future.delayed(const Duration(seconds: 1),()async{
  //     if(context.mounted){
  //       Navigator.pushReplacement(
  //         context, 
  //         MaterialPageRoute(builder: (context)=>BlocProvider.value(value:getIt() ,child:const LoginView(),))
  //       );
  //     }
  //   });
  // }
  
}
