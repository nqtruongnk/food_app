import 'package:app_food/scr/models/products.dart';
import 'package:app_food/scr/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../commons.dart';
List<Product> productsList =[
  Product(name: 'Cereals', price: 15.99,rating: 4.2, vendor: 'GoodFoods', wishList: true, image: '1.jpg'),
  Product(name: 'Taccos', price: 12.99,rating: 4.7, vendor: 'GoodFoods', wishList: false, image: '5.jpg'),
  Product(name: 'Cereals', price: 15.99,rating: 4.2, vendor: 'GoodFoods', wishList: true, image: '1.jpg'),
];
class Featured extends StatelessWidget {
  const Featured({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                height: 240,
                width: 200,
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      offset: Offset(1, 1),
                      blurRadius: 4,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'images/${productsList[index].image}',
                      height: 140,
                      width: 140,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(text: productsList[index].name),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[300],
                                  offset: Offset(1, 1),
                                  blurRadius: 4,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: productsList[index].wishList ? Icon(
                                Icons.favorite,
                                color: red,
                                size: 18,
                              ): Icon(
                                Icons.favorite_border,
                                color: red,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: CustomText(
                                text: productsList[index].rating.toString(),
                                color: grey,
                                size: 14,
                              ),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Icon(
                              Icons.star,
                              color: red,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: red,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: red,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: red,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: grey,
                              size: 16,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CustomText(
                            text: '\$${productsList[index].price}',
                            weight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
