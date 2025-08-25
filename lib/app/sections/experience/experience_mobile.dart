import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/space.dart';
import '../../utils/experience_utils.dart';
import '../../widgets/custom_text_heading.dart';

class ExperienceMobile extends StatelessWidget {
  const ExperienceMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSectionHeading(text: '\nMy experiences so far'),
        Space.y(3.w)!,
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          itemCount: experiences.length,
          itemBuilder: (context, index) {
            final exp = experiences[index];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Timeline indicator
                Column(
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 2,
                      color: Colors.blueAccent.shade100,
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                // Experience card
                Expanded(
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 20),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(exp.duration,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                            const SizedBox(height: 6),
                            Text(exp.title,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Text(exp.company,
                                style: const TextStyle(
                                    fontSize: 14, fontStyle: FontStyle.italic)),
                            const SizedBox(height: 6),
                            Text(exp.description,
                                style: const TextStyle(fontSize: 14)),
                          ]),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
