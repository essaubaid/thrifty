class ShippingAddress {
  final String fullName;
  final String address;
  final String city;
  final String stateProvince;
  final String zipCode;
  final String country;

  ShippingAddress({
    required this.fullName,
    required this.address,
    required this.city,
    required this.stateProvince,
    required this.zipCode,
    required this.country,
  });
}

ShippingAddress demoAddress = ShippingAddress(
  fullName: "John Doe",
  address: "123 Main Street",
  city: "Los Angeles",
  stateProvince: "California",
  zipCode: "90001",
  country: "USA",
);
