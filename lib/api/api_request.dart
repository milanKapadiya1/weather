class ApiReques {
  ApiReques._();
  static const String baseUrl = 'http://dataservice.accuweather.com/';

  static const String topcities = '${baseUrl}locations/v1/topcities/50?apikey=lgtCmhKgnKPe9PAVSurhwn19AM4F0GIo&language=en-US&details=false';

  static const String weather = '${baseUrl}currentconditions/v1/';
  
}