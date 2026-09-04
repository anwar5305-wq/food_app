import 'package:flutter/material.dart';
import '../models/food_model.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  final VoidCallback onFavorite;
  final VoidCallback onAddToCart;

  const FoodCard({
    super.key,
    required this.food,
    required this.onFavorite,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                food.imageUrl,
                width: 105,
                height: 105,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 105,
                  height: 105,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.fastfood, size: 40),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(food.name,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                      ),
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        onPressed: onFavorite,
                        icon: Icon(
                          food.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: food.isFavorite ? Colors.red : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Text(food.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey, fontSize: 13)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 17, color: Colors.amber),
                      const SizedBox(width: 3),
                      Text(food.rating.toString()),
                      const Spacer(),
                      Text('\$${food.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.deepOrange)),
                      const SizedBox(width: 6),
                      InkWell(
                        onTap: onAddToCart,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.add,
                              color: Colors.white, size: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
