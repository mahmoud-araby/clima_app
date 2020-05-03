class CurrentModule {
  double temp;
  double feelLike;
  double windSpeed;
  double humidity;
  int id;
  String time;
  String description;

  CurrentModule(
      {this.feelLike,
      this.temp,
      this.humidity,
      this.windSpeed,
      this.description,
      this.id,
      this.time});
  CurrentModule.formJson(Map<String, dynamic> jsonFile) {
    time = jsonFile['dt'];
    temp = jsonFile['temp'];
    feelLike = jsonFile['feelLike'];
    humidity = jsonFile['humidity'];
    windSpeed = jsonFile['wind_speed'];
    id = jsonFile['weather'][0]['id'];
    description = jsonFile['weather'][0]['description'];
  }
}
