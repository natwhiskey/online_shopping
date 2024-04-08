import 'dart:convert';

ShipingModel shipingModelFromJson(String str) => ShipingModel.fromJson(json.decode(str));

String shipingModelToJson(ShipingModel data) => json.encode(data.toJson());

class ShipingModel {
    List<ProductItem>? productItems;

    ShipingModel({
        this.productItems,
    });

    factory ShipingModel.fromJson(Map<String, dynamic> json) => ShipingModel(
        productItems: json["product_items"] == null ? [] : List<ProductItem>.from(json["product_items"]!.map((x) => ProductItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "product_items": productItems == null ? [] : List<dynamic>.from(productItems!.map((x) => x.toJson())),
    };
}

class ProductItem {
    int? id;
    String? name;
    String? imageUrl;
    int? price;

    ProductItem({
        this.id,
        this.name,
        this.imageUrl,
        this.price,
    });

    factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
        "price": price,
    };
}
