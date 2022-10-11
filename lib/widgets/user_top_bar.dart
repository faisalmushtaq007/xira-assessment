import 'package:ecommerce/app/pages/user/user_bag.dart';
import 'package:ecommerce/app/pages/user/user_favourites.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/pages/providers.dart';

class UserTopBar extends ConsumerWidget {
  final IconButton leadingIconButton;
  const UserTopBar({required this.leadingIconButton, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final bagViewModel = ref.watch(bagProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leadingIconButton,
        const Spacer(),
        // IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () {
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => const UserOrders()));
        //   },
        // ),
        IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserFavourites()));
            },
          ),
        Badge(
          position: BadgePosition.topEnd(top: 0, end: 2),
          badgeContent: Text(bagViewModel.productsBag.isEmpty ? '0' : bagViewModel.productsBag.length.toString(), style: const TextStyle(color: Colors.white),),
          child: IconButton(
            icon: const Icon(Icons.shopping_bag),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserBag()));
            },
          ),
        ),
      ],
    );
  }
}
