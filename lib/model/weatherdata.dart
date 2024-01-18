class WeatherData {
  final String cityName, climate;
  double temp, maxTemp, minTemp, feelsLike;
  final dynamic date, humidity, windSpeed;
  WeatherData(
      {required this.cityName,
      required this.date,
      required this.temp,
      required this.feelsLike,
      required this.maxTemp,
      required this.minTemp,
      required this.humidity,
      required this.windSpeed,
      required this.climate});

  String windSpeedKmph() {
    double speed = (windSpeed.toDouble() * 3600) / 1000;
    return speed.toStringAsFixed(0);
  }

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      cityName: json['city']['name'],
      date: json['list'][0]['dt'],
      temp: json['list'][0]['main']['temp'],
      feelsLike: json['list'][0]['main']['temp'],
      maxTemp: json['list'][0]['main']['temp_max'],
      minTemp: json['list'][0]['main']['temp_min'],
      humidity: json['list'][0]['main']['humidity'],
      windSpeed: json['list'][0]['wind']['speed'],
      climate: json['list'][0]['weather'][0]['main'],
    );
  }
}
