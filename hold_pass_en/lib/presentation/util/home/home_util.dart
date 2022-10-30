
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';
import 'package:hold_pass_en/presentation/bloc/home/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hold_pass_en/presentation/bloc/password/information/pass_information_bloc.dart';

class HomeUtil {

  HomeState? state;
  BuildContext context;

  HomeUtil({this.state, required this.context});

  void onPageChange(int index) async {
    if(index == 0){

      context.read<HomeBloc>().add(
        const RegisterPageSelectEvent(
            iconHeight: .0
      ));
      Timer(const Duration(milliseconds: 450), () {
        context.read<HomeBloc>().add(
          const RegisterPageSelectEvent(
              iconHeight: 25.0
        ));
      });
    } else {
      Timer(const Duration(milliseconds: 450), () {
        context.read<PassInformationBloc>().add(
            const LoadPasswordListEvent(
                passType: PassType.email
            ));
      });

      context.read<HomeBloc>().add(
        const InfoPageSelectEvent(
            iconHeight: .0
      ));
      Timer(const Duration(milliseconds: 450), () {
        context.read<HomeBloc>().add(
          const InfoPageSelectEvent(
              iconHeight: 25.0
        ));
      });
    }
  }

}



