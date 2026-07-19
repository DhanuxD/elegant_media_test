class HotelModel {

  final int id;
  final String title;
  final String description;
  final String address;
  final String postcode;
  final String phoneNumber;
  final String latitude;
  final String longitude;
  final HotelImage image;


  HotelModel({
    required this.id,
    required this.title,
    required this.description,
    required this.address,
    required this.postcode,
    required this.phoneNumber,
    required this.latitude,
    required this.longitude,
    required this.image,
  });



  factory HotelModel.fromJson(Map<String,dynamic> json){

    return HotelModel(

      id: json["id"] ?? 0,

      title: json["title"] ?? "",

      description: json["description"] ?? "",

      address: json["address"] ?? "",

      postcode: json["postcode"] ?? "",

      phoneNumber: json["phoneNumber"] ?? "",

      latitude: json["latitude"] ?? "",

      longitude: json["longitude"] ?? "",

      image: HotelImage.fromJson(
        json["image"] ?? {},
      ),

    );

  }

}



class HotelImage {

  final String small;
  final String medium;
  final String large;


  HotelImage({

    required this.small,
    required this.medium,
    required this.large,

  });



  factory HotelImage.fromJson(Map<String,dynamic> json){


    return HotelImage(

      small: json["small"] ?? "",

      medium: json["medium"] ?? "",

      large: json["large"] ?? "",

    );


  }

}