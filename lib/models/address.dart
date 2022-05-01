import 'package:groshop/utils/constants.dart';

class GHAddress {
  GHAddress({this.heading, this.lat, this.lng, this.address});

  String? heading;
  double? lat;
  double? lng;
  String? address;

  factory GHAddress.fromDocument(Map<String, dynamic> doc) {
    return GHAddress(
        heading: doc[Constants.HEADING],
        lat: doc[Constants.LAT],
        lng: doc[Constants.LNG],
        address: doc[Constants.ADDRESS]);
  }
}
