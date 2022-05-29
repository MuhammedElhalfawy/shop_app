class ProductDetailsModel {
  bool? status;
  DataModel? data;

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] !=null ? DataModel.fromJson(json['data']) :null;
  }
}

// class DetailsDataModel {
//   int? currentPage;
//   List<DataModel> data = [];
//
//   DetailsDataModel.fromJson(Map<String, dynamic> json) {
//     currentPage = json['current_page'];
//     if (json['data'] != null) {
//       data = <DataModel>[];
//       json['data'].forEach((element) {
//         data.add(DataModel.fromJson(element));
//       });
//     }
//   }
// }

class DataModel {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}