// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);

import 'dart:convert';

WeatherModel weatherModelFromJson(String str) => WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  int? queryCost;
  double? latitude;
  double? longitude;
  String? resolvedAddress;
  String? address;
  String? timezone;
  double? tzoffset;
  List<CurrentConditions>? days;
  Stations? stations;
  CurrentConditions? currentConditions;

  WeatherModel({
    this.queryCost,
    this.latitude,
    this.longitude,
    this.resolvedAddress,
    this.address,
    this.timezone,
    this.tzoffset,
    this.days,
    this.stations,
    this.currentConditions,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    queryCost: json["queryCost"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    resolvedAddress: json["resolvedAddress"],
    address: json["address"],
    timezone: json["timezone"],
    tzoffset: json["tzoffset"],
    days: json["days"] == null ? [] : List<CurrentConditions>.from(json["days"]!.map((x) => CurrentConditions.fromJson(x))),
    stations: json["stations"] == null ? null : Stations.fromJson(json["stations"]),
    currentConditions: json["currentConditions"] == null ? null : CurrentConditions.fromJson(json["currentConditions"]),
  );

  Map<String, dynamic> toJson() => {
    "queryCost": queryCost,
    "latitude": latitude,
    "longitude": longitude,
    "resolvedAddress": resolvedAddress,
    "address": address,
    "timezone": timezone,
    "tzoffset": tzoffset,
    "days": days == null ? [] : List<dynamic>.from(days!.map((x) => x.toJson())),
    "stations": stations?.toJson(),
    "currentConditions": currentConditions?.toJson(),
  };
}

class CurrentConditions {
  String? datetime;
  int? datetimeEpoch;
  double? temp;
  double? feelslike;
  double? humidity;
  double? dew;
  double? precip;
  double? precipprob;
  double? snow;
  double? snowdepth;
  List<Icon>? preciptype;
  double? windgust;
  double? windspeed;
  double? winddir;
  double? pressure;
  double? visibility;
  double? cloudcover;
  double? solarradiation;
  double? solarenergy;
  double? uvindex;
  Conditions? conditions;
  Icon? icon;
  List<Station>? stations;
  Source? source;
  String? sunrise;
  int? sunriseEpoch;
  String? sunset;
  int? sunsetEpoch;
  double? moonphase;
  double? tempmax;
  double? tempmin;
  double? feelslikemax;
  double? feelslikemin;
  double? precipcover;
  double? severerisk;
  String? description;
  List<CurrentConditions>? hours;

  CurrentConditions({
    this.datetime,
    this.datetimeEpoch,
    this.temp,
    this.feelslike,
    this.humidity,
    this.dew,
    this.precip,
    this.precipprob,
    this.snow,
    this.snowdepth,
    this.preciptype,
    this.windgust,
    this.windspeed,
    this.winddir,
    this.pressure,
    this.visibility,
    this.cloudcover,
    this.solarradiation,
    this.solarenergy,
    this.uvindex,
    this.conditions,
    this.icon,
    this.stations,
    this.source,
    this.sunrise,
    this.sunriseEpoch,
    this.sunset,
    this.sunsetEpoch,
    this.moonphase,
    this.tempmax,
    this.tempmin,
    this.feelslikemax,
    this.feelslikemin,
    this.precipcover,
    this.severerisk,
    this.description,
    this.hours,
  });

  factory CurrentConditions.fromJson(Map<String, dynamic> json) => CurrentConditions(
    datetime: json["datetime"],
    datetimeEpoch: json["datetimeEpoch"],
    temp: json["temp"]?.toDouble(),
    feelslike: json["feelslike"]?.toDouble(),
    humidity: json["humidity"]?.toDouble(),
    dew: json["dew"]?.toDouble(),
    precip: json["precip"]?.toDouble(),
    precipprob: json["precipprob"]?.toDouble(),
    snow: json["snow"],
    snowdepth: json["snowdepth"],
    preciptype: json["preciptype"] == null ? [] : List<Icon>.from(json["preciptype"]!.map((x) => iconValues.map[x]!)),
    windgust: json["windgust"]?.toDouble(),
    windspeed: json["windspeed"]?.toDouble(),
    winddir: json["winddir"]?.toDouble(),
    pressure: json["pressure"]?.toDouble(),
    visibility: json["visibility"]?.toDouble(),
    cloudcover: json["cloudcover"]?.toDouble(),
    solarradiation: json["solarradiation"]?.toDouble(),
    solarenergy: json["solarenergy"]?.toDouble(),
    uvindex: json["uvindex"],
    conditions: conditionsValues.map[json["conditions"]]!,
    icon: iconValues.map[json["icon"]]!,
    stations: json["stations"] == null ? [] : List<Station>.from(json["stations"]!.map((x) => stationValues.map[x] ?? Station.REMOTE)),
    source: sourceValues.map[json["source"]]!,
    sunrise: json["sunrise"],
    sunriseEpoch: json["sunriseEpoch"],
    sunset: json["sunset"],
    sunsetEpoch: json["sunsetEpoch"],
    moonphase: json["moonphase"]?.toDouble(),
    tempmax: json["tempmax"]?.toDouble(),
    tempmin: json["tempmin"]?.toDouble(),
    feelslikemax: json["feelslikemax"]?.toDouble(),
    feelslikemin: json["feelslikemin"]?.toDouble(),
    precipcover: json["precipcover"]?.toDouble(),
    severerisk: json["severerisk"],
    description: json["description"],
    hours: json["hours"] == null ? [] : List<CurrentConditions>.from(json["hours"]!.map((x) => CurrentConditions.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "datetime": datetime,
    "datetimeEpoch": datetimeEpoch,
    "temp": temp,
    "feelslike": feelslike,
    "humidity": humidity,
    "dew": dew,
    "precip": precip,
    "precipprob": precipprob,
    "snow": snow,
    "snowdepth": snowdepth,
    "preciptype": preciptype == null ? [] : List<dynamic>.from(preciptype!.map((x) => iconValues.reverse[x])),
    "windgust": windgust,
    "windspeed": windspeed,
    "winddir": winddir,
    "pressure": pressure,
    "visibility": visibility,
    "cloudcover": cloudcover,
    "solarradiation": solarradiation,
    "solarenergy": solarenergy,
    "uvindex": uvindex,
    "conditions": conditionsValues.reverse[conditions],
    "icon": iconValues.reverse[icon],
    "stations": stations == null ? [] : List<dynamic>.from(stations!.map((x) => stationValues.reverse[x])),
    "source": sourceValues.reverse[source],
    "sunrise": sunrise,
    "sunriseEpoch": sunriseEpoch,
    "sunset": sunset,
    "sunsetEpoch": sunsetEpoch,
    "moonphase": moonphase,
    "tempmax": tempmax,
    "tempmin": tempmin,
    "feelslikemax": feelslikemax,
    "feelslikemin": feelslikemin,
    "precipcover": precipcover,
    "severerisk": severerisk,
    "description": description,
    "hours": hours == null ? [] : List<dynamic>.from(hours!.map((x) => x.toJson())),
  };
}

enum Conditions {
  CLEAR,
  OVERCAST,
  PARTIALLY_CLOUDY,
  RAIN
}

final conditionsValues = EnumValues({
  "Clear": Conditions.CLEAR,
  "Overcast": Conditions.OVERCAST,
  "Partially cloudy": Conditions.PARTIALLY_CLOUDY,
  "Rain": Conditions.RAIN
});

enum Icon {
  CLEAR_DAY,
  CLEAR_NIGHT,
  CLOUDY,
  PARTLY_CLOUDY_DAY,
  PARTLY_CLOUDY_NIGHT,
  RAIN
}

final iconValues = EnumValues({
  "clear-day": Icon.CLEAR_DAY,
  "clear-night": Icon.CLEAR_NIGHT,
  "cloudy": Icon.CLOUDY,
  "partly-cloudy-day": Icon.PARTLY_CLOUDY_DAY,
  "partly-cloudy-night": Icon.PARTLY_CLOUDY_NIGHT,
  "rain": Icon.RAIN
});

enum Source {
  COMB,
  FCST,
  OBS
}

final sourceValues = EnumValues({
  "comb": Source.COMB,
  "fcst": Source.FCST,
  "obs": Source.OBS
});

enum Station {
  OPFA,
  REMOTE
}

final stationValues = EnumValues({
  "OPFA": Station.OPFA,
  "remote": Station.REMOTE
});

class Stations {
  Opfa? opfa;

  Stations({
    this.opfa,
  });

  factory Stations.fromJson(Map<String, dynamic> json) => Stations(
    opfa: json["OPFA"] == null ? null : Opfa.fromJson(json["OPFA"]),
  );

  Map<String, dynamic> toJson() => {
    "OPFA": opfa?.toJson(),
  };
}

class Opfa {
  double? distance;
  double? latitude;
  double? longitude;
  int? useCount;
  Station? id;
  Station? name;
  int? quality;
  double? contribution;

  Opfa({
    this.distance,
    this.latitude,
    this.longitude,
    this.useCount,
    this.id,
    this.name,
    this.quality,
    this.contribution,
  });

  factory Opfa.fromJson(Map<String, dynamic> json) => Opfa(
    distance: json["distance"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"],
    useCount: json["useCount"],
    id: stationValues.map[json["id"]]!,
    name: stationValues.map[json["name"]]!,
    quality: json["quality"],
    contribution: json["contribution"],
  );

  Map<String, dynamic> toJson() => {
    "distance": distance,
    "latitude": latitude,
    "longitude": longitude,
    "useCount": useCount,
    "id": stationValues.reverse[id],
    "name": stationValues.reverse[name],
    "quality": quality,
    "contribution": contribution,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
