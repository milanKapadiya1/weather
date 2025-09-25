class Country {
    final String id;
    final String localizedName;
    final String englishName;

    Country({
        required this.id,
        required this.localizedName,
        required this.englishName,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["ID"],
        localizedName: json["LocalizedName"],
        englishName: json["EnglishName"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "LocalizedName": localizedName,
        "EnglishName": englishName,
    };
}
