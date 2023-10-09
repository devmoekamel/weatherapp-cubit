
abstract class Weatherstate {}

class WeatherInitialState extends Weatherstate {}

class WeatherLoadingState extends Weatherstate {}

class WeatherSuccessState extends Weatherstate {}

class WeatherfailureState extends Weatherstate {}
