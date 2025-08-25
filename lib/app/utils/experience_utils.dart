class ExperienceUtils {
  final String title;
  final String company;
  final String duration;
  final String description;

  const ExperienceUtils({
    required this.title,
    required this.company,
    required this.duration,
    required this.description,
  });
}

final List<ExperienceUtils> experiences = [
  const ExperienceUtils(
    title: "System Software Engineer",
    company: "Krishworks Innovation & Technology, Bangalore",
    duration: "July 2024 – Present",
    description: "Flutter, IoT, Node.js backend, AWS & real-time integrations.",
  ),
  const ExperienceUtils(
    title: "Associate Flutter Developer",
    company: "Techabet, Mohali",
    duration: "Dec 2023 – June 2024",
    description:
        "Healthcare & IoT apps, Hive storage, real-time sockets, GetX.",
  ),
  const ExperienceUtils(
    title: "Flutter & UI Developer (Intern)",
    company: "Freshnic",
    duration: "May 2023 – June 2023",
    description: "Responsive Flutter UI, APIs, and Provider state management.",
  ),
];
