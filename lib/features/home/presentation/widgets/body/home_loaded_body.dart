import 'package:flutter/material.dart';

import '../../bloc/home_state.dart';
import '../app_bar/home_app_bar.dart';
import '../business/home_business_card.dart';
import '../business/home_businesses_header.dart';
import '../user/home_user_card.dart';

class HomeLoadedBody extends StatelessWidget {
  final HomeLoaded state;

  const HomeLoadedBody({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        HomeAppBar(user: state.user),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              HomeUserCard(user: state.user),
              const SizedBox(height: 24),
              HomeBusinessesHeader(count: state.businesses.length),
              const SizedBox(height: 12),
            ]),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList.builder(
            itemCount: state.businesses.length,
            itemBuilder: (context, index) =>
                HomeBusinessCard(business: state.businesses[index]),
          ),
        ),
      ],
    );
  }
}
