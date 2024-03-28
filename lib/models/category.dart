class Category {
  final String alias;
  final String title;

  Category({
    required this.alias,
    required this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      alias: json['alias'] ?? '',
      title: json['title'] ?? '',
    );
  }
}

List<Category> categories = [
  Category(alias: "moroccan", title: "Moroccan"),
  Category(alias: "venues", title: "Venues & Event Spaces"),
  Category(alias: "bars", title: "Bars"),
  Category(alias: "asianfusion", title: "Asian Fusion"),
  Category(alias: "noodles", title: "Noodles"),
  Category(alias: "wine_bars", title: "Wine Bars"),
  Category(alias: "seafood", title: "Seafood"),
  Category(alias: "pizza", title: "Pizza"),
  Category(alias: "italian", title: "Italian"),
  Category(alias: "cocktailbars", title: "Cocktail Bars"),
  Category(alias: "sushi", title: "Sushi Bars"),
  Category(alias: "japanese", title: "Japanese"),
  Category(alias: "laotian", title: "Laotian"),
  Category(alias: "thai", title: "Thai"),
  Category(alias: "french", title: "French"),
  Category(alias: "newamerican", title: "New American"),
  Category(alias: "breakfast_brunch", title: "Breakfast & Brunch"),
  Category(alias: "champagne_bars", title: "Champagne Bars"),
  Category(alias: "tacos", title: "Tacos"),
  Category(alias: "vietnamese", title: "Vietnamese"),
  Category(alias: "chinese", title: "Chinese"),
];
