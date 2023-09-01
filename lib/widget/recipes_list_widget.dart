import 'package:flutter/material.dart';

import '../resources/resources.dart';

class Recipes {
  int id;
  final String imageName;
  final String recipeName;
  final String timer;
  Recipes({
    required this.id,
    required this.imageName,
    required this.recipeName,
    required this.timer,
  });
}

class RecipesListWidget extends StatefulWidget {
  const RecipesListWidget({super.key});

  @override
  State<RecipesListWidget> createState() => _RecipesListWidgetState();
}

class _RecipesListWidgetState extends State<RecipesListWidget> {
  final _recipes = [
    Recipes(
      id: 1,
      imageName: AppImages.salmon,
      recipeName: 'Лосось в соусе терияки',
      timer: '45 минут',
    ),
    Recipes(
        id: 2,
        imageName: AppImages.pokeboul1,
        recipeName: 'Поке боул с сыром тофу',
        timer: '30 минут'),
    Recipes(
        id: 3,
        imageName: AppImages.steakonBoard,
        recipeName: 'Стейк из говядины по-грузински с кукурузой',
        timer: '1 час 15 минут'),
    Recipes(
        id: 4,
        imageName: AppImages.bananaandBlueberryToast,
        recipeName: 'Тосты с голубикой и бананом',
        timer: '45 минут'),
    Recipes(
        id: 5,
        imageName: AppImages.pastawithseafood,
        recipeName: 'Паста с морепродуктами',
        timer: '25 минут'),
    Recipes(
        id: 6,
        imageName: AppImages.pastacarbonara,
        recipeName: 'Паста карбонара',
        timer: '30 минут'),
    Recipes(
        id: 7,
        imageName: AppImages.margaritapizzahomemade,
        recipeName: 'Пицца маргарита домашняя',
        timer: '40 минут'),
    Recipes(
        id: 8,
        imageName: AppImages.caesarsalad,
        recipeName: 'Салат цезарь',
        timer: '15 минут'),
  ];

  void _onRecipeTap(int index) {
    var id = _recipes[index].id;
    if (id == 1) {
      Navigator.pushNamed(context, '/recipeInfo');
    } else if (id == 2) {
      Navigator.pushNamed(context, '/recipeInfoPokeboul');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffececec6),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff2ECC71),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pizza),
            label: 'Рецепты',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Вход',
          ),
        ],
      ),
      body: Stack(children: [
        const Padding(
          padding: EdgeInsets.only(top: 11, left: 326),
          child: Icon(
            Icons.signal_cellular_alt,
            weight: 16,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 11,
            left: 350,
          ),
          child: Icon(
            Icons.wifi,
            weight: 16,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 11, left: 374),
          child: Icon(
            Icons.battery_6_bar_sharp,
            weight: 16,
          ),
        ),
        const SizedBox(
          width: 428,
          height: 35,
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 56),
            child: SizedBox(
              height: 18,
              width: 39,
              child: Text(
                '20:00',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: double.infinity),
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(padding: EdgeInsets.only(top: 24));
              },
              itemCount: _recipes.length,
              itemBuilder: (BuildContext context, int index) {
                {
                  final recipes = _recipes[index];
                  return Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      width: 396,
                      height: 136,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                            child: Image(
                              fit: BoxFit.fitHeight,
                              image: AssetImage(recipes.imageName),
                              width: 149,
                              height: 136,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 165, top: 30),
                            child: SizedBox(
                              width: 208,
                              child: Text(
                                recipes.recipeName,
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 2,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 95, left: 165),
                            child: Icon(
                              Icons.watch_later_outlined,
                              size: 16,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 94, left: 192),
                            child: SizedBox(
                              height: 19,
                              child: Text(
                                recipes.timer,
                                style: const TextStyle(
                                    color: Color(0xff2ECC71), fontSize: 16),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () => _onRecipeTap(index),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ]),
    );
  }
}
