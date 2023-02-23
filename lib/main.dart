import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pruebatecnica/router/app_routers.dart';

import 'home/bloc/get_all_characters/characters_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharactersBloc>(
          create: (context) => CharactersBloc()..add(GetAllCharacters()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Rick and Morty',
        initialRoute: AppRouters.initialRoute,
        routes: AppRouters.getAppRoutes(),
        onGenerateRoute: AppRouters.onGenerateRoute,
      ),
    );
  }
}
