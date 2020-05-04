class Prodduct {

  String type;
  String image;
  String item;
  String rank;
  String description;
  String mainCompany;
  double panelRating;
  double customerRating;
  String areaService;
  String commitment;
  double fixPrice;
  double customerPrice;
  bool expended;

  Prodduct({
    this.type,
    this.image,
    this.item,
    this.rank,
    this.description,
    this.areaService,
    this.commitment,
    this.customerPrice,
    this.customerRating,
    this.fixPrice,
    this.mainCompany,
    this.panelRating,
    this.expended = false,
  });

}

class Product {
  int id;
  String name;
  String image;
  List<GlobalProduct> globalProduct;

  Product({this.id, this.name, this.image, this.globalProduct});

}


class GlobalProduct {
  int id;
  String image;
  String productCode;
  String name;
  String details;
  String description;
  int qualityId;
  double panelRating;
  String rank;

}

