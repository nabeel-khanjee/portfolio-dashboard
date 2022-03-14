import 'package:flutter/material.dart';
import 'package:flutter_profile/models/Experience.dart';

import '../../../constants.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    Key? key,
    required this.experience,
  }) : super(key: key);

  final Experience experience;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: EdgeInsets.all(defaultPadding),
      color: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: Text(
              experience.jobTitle!,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          SingleChildScrollView(child: Text(experience.organization!)),
          const SizedBox(height: defaultPadding),
          SingleChildScrollView(child: Text(experience.duration!)),
          const SizedBox(height: defaultPadding),
        
          SingleChildScrollView(
            child: Text(
              experience.description!,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(height: 1.5),
            ),
          )
        ],
      ),
    );
  }
}
