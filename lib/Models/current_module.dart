class CurrentModule {
  int time;
  int sunrise;
  int sunset;
  int temp;
  int feelLike;
  int humidity;
  double windSpeed;
  int windDeg;
  int id;
  String description;

  CurrentModule(
      {this.feelLike,
      this.temp,
      this.humidity,
      this.windSpeed,
      this.description,
      this.id,
      this.time,
      this.sunset,
      this.sunrise,
      this.windDeg});
  CurrentModule.formJson(Map<String, dynamic> jsonFile) {
    time = jsonFile['dt'];
    sunrise = jsonFile['sunrise'];
    sunset = jsonFile['sunset'];
    temp = jsonFile['temp'].toInt();
    feelLike = jsonFile['feels_like'].toInt();
    humidity = jsonFile['humidity'].toInt();
    windSpeed = jsonFile['wind_speed'];
    windDeg = jsonFile['wind_deg'].toInt();
    id = jsonFile['weather'][0]['id'];
    description = jsonFile['weather'][0]['description'];
  }
}
