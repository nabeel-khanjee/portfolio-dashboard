import 'package:flutter/material.dart';
import 'package:flutter_profile/models/Experience.dart';
import 'package:flutter_profile/screens/home/components/experience_card.dart';

import '../../../constants.dart';

class Experiences extends StatelessWidget {
  const Experiences({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Experience",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: defaultPadding),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                experience.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: defaultPadding),
                  child: ExperienceCard(
                    experience: experience[index],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

