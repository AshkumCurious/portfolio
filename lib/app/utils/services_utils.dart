class ServicesUtils {
  final String name;
  final String icon;
  final List<String> tool;
  final String description;

  ServicesUtils(
      {required this.name,
      required this.icon,
      required this.description,
      required this.tool});
}

List<ServicesUtils> servicesUtils = [
  ServicesUtils(
    name: 'Flutter App Development',
    icon: 'assets/icons/mobile.svg',
    description:
        "Building high-performance cross-platform mobile applications with clean architecture and smooth UI/UX.",
    tool: ['Flutter', 'Dart', 'Provider', 'Bloc', 'GetX'],
  ),
  ServicesUtils(
    name: 'Backend Development',
    icon: 'assets/icons/backend.svg',
    description:
        "Designing and implementing scalable backend systems with APIs and database integration.",
    tool: ['Node.js', 'PostgreSQL', 'Sequelize', 'WebSocket', 'REST APIs'],
  ),
  ServicesUtils(
    name: 'IoT & Real-Time Solutions',
    icon: 'assets/icons/iot.svg',
    description:
        "Developing IoT applications with real-time communication and device integration.",
    tool: ['MQTT', 'Bluetooth', 'Embedded Servers', 'Socket Programming'],
  ),
  ServicesUtils(
    name: 'Cloud & Database Integration',
    icon: 'assets/icons/data.svg',
    description:
        "Leveraging cloud services and local storage for secure, scalable, and reliable applications.",
    tool: [
      'Firebase (Auth, Firestore, Cloud Functions)',
      'AWS (EC2, SES)',
      'Hive'
    ],
  ),
  ServicesUtils(
    name: 'Competitive Programming',
    icon: 'assets/icons/cp.svg',
    description:
        "Sharpening problem-solving skills and optimizing algorithms through coding challenges.",
    tool: ['C++', 'DSA', 'Problem Solving'],
  ),
];
