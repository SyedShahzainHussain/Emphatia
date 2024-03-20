import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/patient_home/patient_home_bottom.dart';
import 'package:store/features/authentication/view/modules/patient/meditation_screen.dart';
import 'package:store/features/authentication/view/modules/patient/profile_screen.dart';
import 'package:store/utils/constants/colors.dart';


class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PatientHomeBottom>(
      builder: (context, value, _) => Scaffold(
        
          bottomNavigationBar: NavigationBar(
            backgroundColor: TColors.primary,

            selectedIndex: value.currentIndex,
            onDestinationSelected: (index) => value.changePage(index),
            indicatorColor: TColors.darkerGrey,
            
           
            destinations: const [
              NavigationDestination(

                  icon: Icon(Iconsax.home),
                  selectedIcon: Icon(Iconsax.home1),
                  label: "Feeds",
                  ),
              NavigationDestination(
                  icon: Icon(Icons.music_note_outlined),
                  selectedIcon: Icon(Icons.music_note_rounded),
                  label: "Meditation"),
              NavigationDestination(
                  icon: Icon(Icons.person_2_outlined),
                  selectedIcon: Icon(Icons.person_2),
                  label: "Profile"),
            ],
          ),
          body: [
            const Center(child: Text("Feed")),
            const MeditationScreen(),
            const ProfileScreen(),
          ][value.currentIndex]),
    );
  }
}
