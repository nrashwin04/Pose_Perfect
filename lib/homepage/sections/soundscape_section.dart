import 'package:flutter/material.dart';
import '../widgets/soundscape_card.dart';

class SoundscapeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Soundscapes',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Color(0xFF1B4332),
          ),
        ),
        const SizedBox(height: 12.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SoundscapeCard(
                title: 'Ocean Waves',
                description: 'Relax with the soothing sound of ocean waves.',
                icon: Icons.spa,
                backgroundImage: 'assets/sound_ocean.jpg',
              ),
              SoundscapeCard(
                title: 'Rainforest',
                description: 'Immerse yourself in the sounds of the rainforest.',
                icon: Icons.nature,
                backgroundImage: 'assets/sound_forest.jpg',
              ),
              SoundscapeCard(
                title: 'Campfire',
                description: 'Unwind to the crackling sound of a campfire.',
                icon: Icons.local_fire_department,
                backgroundImage: 'assets/sound_campfire.jpg',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
