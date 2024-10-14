class BurgerModal {
  late String name, description, url, logo;

  BurgerModal({
    required this.name,
    required this.description,
    required this.url,
    required this.logo,
  });

  factory BurgerModal.fromMap(Map m1) {
    return BurgerModal(
      name: m1['name'],
      description: m1['description'],
      url: m1['url'],
      logo: m1['logo'],
    );
  }
}
