import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/cubits/weather_cubit/weather_cubit.dart';
import 'package:weatherapp/cubits/weather_cubit/wheater_state.dart';

import 'package:weatherapp/screens/home_page.dart';
import 'package:weatherapp/service/wethear_service.dart';

import 'providers/weather_provider.dart';

void main() {
  runApp(BlocProvider(
     create: (context) {
        return WeatherCubit(WeatherService());
      },
    child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel == null ?  Colors.blue : BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor()  ,
      ),
      home: HomePage(),
    );
  }
}
