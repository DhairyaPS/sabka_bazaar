import 'dart:convert';

ProductItem productItemFromJson(String str) => ProductItem.fromJson(json.decode(str));

String productItemToJson(ProductItem data) => json.encode(data.toJson());

class ProductItem {
    ProductItem({
        this.items,
    });

    List<Item>? items;

    factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class Item {
    Item({
        this.id,
        this.name,
        this.products,
    });

    String? id;
    String? name;
    List<Product>? products;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        this.title,
        this.imageName,
        this.isFlagVisible,
        this.description,
        this.pieces,
        this.price,
        this.isShellLifeVisible,
        this.cartQuantity,
    });

    String? title;
    String? imageName;
    bool? isFlagVisible;
    String? description;
    String? pieces;
    String? price;
    bool? isShellLifeVisible;
    int? cartQuantity;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        title: json["title"],
        imageName: json["imageName"],
        isFlagVisible: json["isFlagVisible"],
        description: json["description"],
        pieces: json["pieces"],
        price: json["price"],
        isShellLifeVisible: json["isShellLifeVisible"],
        cartQuantity: json["cartQuantity"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "imageName": imageName,
        "isFlagVisible": isFlagVisible,
        "description": description,
        "pieces": pieces,
        "price": price,
        "isShellLifeVisible": isShellLifeVisible,
        "cartQuantity": cartQuantity,
    };
}
