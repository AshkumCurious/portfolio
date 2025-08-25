import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/space.dart';
import '../../utils/experience_utils.dart';
import '../../widgets/custom_text_heading.dart';

class ExperienceDesktop extends StatelessWidget {
  const ExperienceDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const CustomSectionHeading(text: '\nMy experiences so far'),
          Space.y(1.w)!,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 40),
            itemCount: experiences.length,
            itemBuilder: (context, index) {
              final exp = experiences[index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Timeline
                  Column(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 3,
                        color: Colors.blueAccent.shade100,
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  // Wider card for desktop
                  Expanded(
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 40),
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(exp.duration,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey)),
                              const SizedBox(height: 8),
                              Text(exp.title,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text(exp.company,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic)),
                              const SizedBox(height: 10),
                              Text(exp.description,
                                  style: const TextStyle(fontSize: 15)),
                            ]),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
