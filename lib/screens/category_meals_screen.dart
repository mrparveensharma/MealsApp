import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMeals extends StatelessWidget {
  // final String id;
  // final String title;
  // CategoryMeals({@required this.title, @required this.id});
  // Above arguments was used in case of MaterialPageRoute
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final meals = DUMMY_MEALS.where((item) {
      return item.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: ((ctx, index) {
          return MealItem(
            title: meals[index].title,
            imageUrl: meals[index].imageUrl,
            affordability: meals[index].affordability,
            complexity: meals[index].complexity,
            duration: meals[index].duration,
          );
        }),
        itemCount: meals.length,
      ),
    );
  }
}
