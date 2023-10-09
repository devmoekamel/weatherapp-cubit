

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/weather_cubit/wheater_state.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:weatherapp/service/wethear_service.dart';

class WeatherCubit extends Cubit<Weatherstate>{

WeatherCubit(this.weatherService):super(WeatherInitialState());

WeatherService weatherService  ;
WeatherModel? weatherModel;

String ?cityName;

void GetWeather({required String cityName})
async{
  emit(WeatherLoadingState());

  try{
    weatherModel =  await weatherService.getWeather(cityName:cityName );
    emit(WeatherSuccessState());
  }on Exception {
    emit(WeatherfailureState());
  }



}


}