class DaysModule {
  int time;
  int sunrise;
  int sunset;
  double temp;
  double min;
  double max;
  double day;
  double night;
  double eve;
  double morn;
  double dayFeelLike;
  double nightFeelLike;
  double eveFeelLike;
  double mornFeelLike;
  double humidity;
  double windSpeed;
  int id;
  String description;

  DaysModule(
      {this.humidity,
      this.windSpeed,
      this.description,
      this.id,
      this.time,
      this.day,
      this.dayFeelLike,
      this.eve,
      this.eveFeelLike,
      this.max,
      this.min,
      this.morn,
      this.mornFeelLike,
      this.night,
      this.nightFeelLike,
      this.sunrise,
      this.sunset});

  DaysModule.formJson(Map<String, dynamic> jsonFile) {
    time = jsonFile['dt'];
    sunrise = jsonFile['sunrise'];
    sunset = jsonFile['sunset'];
    min = jsonFile['min'];
    max = jsonFile['max'];
    day = jsonFile['day'];
    night = jsonFile['night'];
    eve = jsonFile['eve'];
    morn = jsonFile['morn'];
    dayFeelLike = jsonFile['feels_like']['day'];
    nightFeelLike = jsonFile['feels_like']['night'];
    eveFeelLike = jsonFile['feels_like']['eve'];
    mornFeelLike = jsonFile['feels_like']['morn'];
    humidity = jsonFile['humidity'];
    windSpeed = jsonFile['wind_speed'];
    id = jsonFile['weather'][0]['id'];
    description = jsonFile['weather'][0]['description'];
  }
}
