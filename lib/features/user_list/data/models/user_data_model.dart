import '../../domain/entity/user_data_entity.dart';

class UserDataModel extends UserDataEntity {
  const UserDataModel({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required super.address,
    required super.phone,
    required super.website,
    required super.company,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: json['address'] != null
          ? Address.fromJson(json['address'])
          : null,
      phone: json['phone'],
      website: json['website'],
      company: json['company'] != null
          ? Company.fromJson(json['company'])
          : null,
    );
  }
}

class Address extends AddressEntity {
  const Address({
    required super.street,
    required super.suite,
    required super.city,
    required super.zipcode,
    required super.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: json['geo'] != null ? Geo.fromJson(json['geo']) : null,
    );
  }
}

class Geo extends GeoEntity {
  const Geo({required super.lat, required super.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(lat: json['lat'], lng: json['lng']);
  }
}

class Company extends CompanyEntity {
  const Company({
    required super.name,
    required super.catchPhrase,
    required super.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
}
