class ShopModel {
  final String title;
  final String description;
  final int price;
  final int discount;
  final String image;

  ShopModel(
      {required this.title,
      required this.description,
      required this.price,
      required this.discount,
      required this.image});
}

class ShopMoreView {
  final String title;
  final int price;
  final List<MoreView> images;

  ShopMoreView(
      {required this.title, required this.price, required this.images});
}

class MoreView {
  final String image;

  MoreView({required this.image});
}
