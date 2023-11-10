import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wether_app/features/weather/data/data_sources/weatherremotedatasources.dart';
import 'package:wether_app/features/weather/data/models/weather_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());

  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());

    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
