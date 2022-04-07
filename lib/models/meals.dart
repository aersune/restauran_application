import 'dart:ui';

class Meal {
  int id;
  String name;
  String imageUrl;
  String time;
  int inCount;
  int bannerColor;
  String cost;

  Meal({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.time,
    required this.inCount,
    required this.bannerColor,
    required this.cost
  });

  static List<Meal> meals = [
    Meal(
        id: 1,
        name: 'Шашлык бараньих ребрышек',
        imageUrl: 'assets/images/lagmon_shorva.png',
        time: '15 мин',
        inCount: 5,
        bannerColor: 0xffF2DFE1,
        cost: "900 000 so'm"
    ),
    Meal(
        id: 2,
        name: 'Шашлык',
        imageUrl: 'assets/images/lagmon_shorva.png',
        time: '20 мин',
        inCount: 4,
        bannerColor: 0xffDCC7B1,
        cost: "150 000 so'm"
    ),
    Meal(
        id: 3,
        name: 'Шашлык 1',
        imageUrl: 'assets/images/tabaka.png',
        time: '25 мин',
        inCount: 5,
        bannerColor: 0xffFFC5A8,
        cost: "260 000 so'm"
    ),
    Meal(
        id: 4,
        name: 'Шашлык 2',
        imageUrl: 'assets/images/lagmon.png',
        time: '20 мин',
        inCount: 6,
        bannerColor: 0xff71C3A1,
        cost: "526 000 so'm"
    ),
    Meal(
        id: 5,
        name: 'Шашлык 3',
        imageUrl: 'assets/images/chicken_fast_food.png',
        time: '20 мин',
        inCount: 7,
        bannerColor: 0xffA8B6FF,
        cost: "400 000 so'm"
    ),
    Meal(
        id: 6,
        name: 'Шашлык 4',
        imageUrl: 'assets/images/noodles.png',
        time: '20 мин',
        inCount: 4,
        bannerColor: 0xffFFE7A8,
        cost: "250 000 so'm"
    ),
    Meal(
        id: 7,
        name: 'Шашлык 5',
        imageUrl: 'assets/images/salad.png',
        time: '20 мин',
        inCount: 7,
        bannerColor: 0xffCEA8FF,
        cost: "300 000 so'm"
    ),
  ];
}
