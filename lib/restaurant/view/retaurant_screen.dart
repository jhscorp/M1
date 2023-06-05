import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m1/common/component/pagination_list_view.dart';
import 'package:m1/restaurant/component/restaurant_card.dart';
import 'package:m1/restaurant/provider/restaurant_provider.dart';
import 'package:m1/restaurant/view/restaurant_detail_screen.dart';

class RestaurantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaginationListView(
      provider: restaurantProvider,
      itemBuilder: <RestaurantModel>(_, index, model) {
        return GestureDetector(
          onTap: () {
            context.goNamed(
              RestaurantDetailScreen.routeName,
              pathParameters: {
                'rid': model.id,
              },
            );
          },
          child: RestaurantCard.fromModel(
            model: model,
          ),
        );
      },
    );
  }
}
