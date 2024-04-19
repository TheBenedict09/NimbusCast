import 'package:lottie/lottie.dart';

LottieBuilder weatherIconSelection(int weather) {
  switch (weather) {
    case 804:
      return Lottie.asset('assets/animations/Overcast Clouds.json');

    case 803:
      return Lottie.asset('assets/animations/Overcast Clouds.json');

    case 800:
      return Lottie.asset('assets/animations/Clear sky.json');

    case 731:
      return Lottie.asset('assets/animations/Fog.json');

    case 741:
      return Lottie.asset('assets/animations/Fog.json');

    case 700:
      return Lottie.asset('assets/animations/Misty.json');

    case 711:
      return Lottie.asset('assets/animations/Misty.json');

    case 721:
      return Lottie.asset('assets/animations/Misty.json');

    case 802:
      return Lottie.asset('assets/animations/Scattered clouds.json');

    case 801:
      return Lottie.asset('assets/animations/Scattered clouds.json');

    case 202:
      return Lottie.asset('assets/animations/Thunderstorm with heavyrain.json');

    case 232:
      return Lottie.asset('assets/animations/Thunderstorm with heavyrain.json');

    case 200:
      return Lottie.asset('assets/animations/Thunderstorm with lightrain.json');

    case 201:
      return Lottie.asset('assets/animations/Thunderstorm with lightrain.json');

    case 230:
      return Lottie.asset('assets/animations/Thunderstorm.json');

    case 231:
      return Lottie.asset('assets/animations/Thunderstorm with lightrain.json');

    default:
      return Lottie.asset(
          'assets/animations/Thunderstorm with unknown precipitation.json');
  }
}
