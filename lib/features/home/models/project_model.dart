class ProjectModel {
  final String title;
  final String description;
  final String descriptionAr;
  final String date;
  final List<String> features;
  final String? playStoreUrl;
  final String? githubUrl;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.descriptionAr,
    required this.date,
    required this.features,
    this.playStoreUrl,
    this.githubUrl,
  });
}

