class Addon {
  String name;
  String description;
  int monthlyPrice;
  int yearlyPrice;
  bool isSelected;

  Addon({
    required this.name,
    required this.description,
    required this.monthlyPrice,
    required this.yearlyPrice,
    required this.isSelected,
  });
}
