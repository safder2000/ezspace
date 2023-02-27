import 'package:ezspace/application/bloc/home_bloc.dart';
import 'package:ezspace/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        BlocProvider.of<HomeBloc>(context).add(FetchSuggesions());
        return Scaffold(
          body: state.suggesionList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : HomePage(),
        );
      },
    );
  }
}
