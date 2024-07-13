import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhiteVColor,
      body: Text("Favorite"),
    );
  }
}
