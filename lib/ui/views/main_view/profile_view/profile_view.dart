import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhiteVColor,
      body: Column(
        children: [
          Text("Profile"),
        ],
      ),
    );
  }
}
