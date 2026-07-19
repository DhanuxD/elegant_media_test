import 'package:url_launcher/url_launcher.dart';

class MapService {

  static Future<void> openMap({
    required double latitude,
    required double longitude,
  }) async {

    final Uri url = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude",
    );
    // final Uri url = Uri.parse(
    //   "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude",
    // );


    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );

  }

}