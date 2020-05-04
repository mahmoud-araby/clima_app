class DaysModule {
  int time;
  int sunrise;
  int sunset;
  int temp;
  int min;
  int max;
  int day;
  int night;
  int eve;
  int morn;
  int dayFeelLike;
  int nightFeelLike;
  int eveFeelLike;
  int mornFeelLike;
  int humidity;
  int windSpeed;
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
    sunrise = jsonFile['sunrise'].toInt();
    sunset = jsonFile['sunset'].toInt();
    min = jsonFile['temp']['min'].toInt();
    max = jsonFile['temp']['max'].toInt();
    day = jsonFile['temp']['day'].toInt();
    night = jsonFile['temp']['night'].toInt();
    eve = jsonFile['temp']['eve'].toInt();
    morn = jsonFile['temp']['morn'].toInt();
    dayFeelLike = jsonFile['feels_like']['day'].toInt();
    nightFeelLike = jsonFile['feels_like']['night'].toInt();
    eveFeelLike = jsonFile['feels_like']['eve'].toInt();
    mornFeelLike = jsonFile['feels_like']['morn'].toInt();
    humidity = jsonFile['humidity'].toInt();
    windSpeed = jsonFile['wind_speed'].toInt();
    id = jsonFile['weather'][0]['id'];
    description = jsonFile['weather'][0]['description'];
  }
}
