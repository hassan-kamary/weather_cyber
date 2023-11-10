import 'package:dartz/dartz.dart';
import 'package:wether_app/core/errors/failures.dart';
import 'package:wether_app/features/weather/domain/entities/weather.dart';

abstract class WeatherRepositories {
  Future<Either<Failure, List<Weather>>> getWeather();
}
