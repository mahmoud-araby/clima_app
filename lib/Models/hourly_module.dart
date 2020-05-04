class HourlyModule {
  int temp;
  int feelLike;
  int windSpeed;
  int humidity;
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
    temp = jsonFile['temp'].toInt();
    feelLike = jsonFile['feels_like'].toInt();
    humidity = jsonFile['humidity'].toInt();
    windSpeed = jsonFile['wind_speed'].toInt();
    id = jsonFile['weather'][0]['id'].toInt();
    description = jsonFile['weather'][0]['description'];
  }
}
