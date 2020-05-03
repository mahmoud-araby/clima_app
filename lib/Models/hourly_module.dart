class HourlyModule {
  double temp;
  double feelLike;
  double windSpeed;
  double humidity;
  int id;
  int time;
  String description;

  HourlyModule(
      {this.feelLike,
      this.temp,
      this.humidity,
      this.windSpeed,
      this.description,
      this.id,
      this.time});
  HourlyModule.formJson(Map<String, dynamic> jsonFile) {
    time = jsonFile['dt'];
    temp = jsonFile['temp'];
    feelLike = jsonFile['feelLike'];
    humidity = jsonFile['humidity'];
    windSpeed = jsonFile['wind_speed'];
    id = jsonFile['weather'][0]['id'];
    description = jsonFile['weather'][0]['description'];
  }
}
