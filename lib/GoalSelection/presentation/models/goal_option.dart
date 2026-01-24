class GoalOption {
  final String title;
  final String description;
  final String
  iconPath; // Using Material Symbols, this might be the icon name or code point
  final String route;
  final String cardColorType; // 'gold' or 'cyan' to match design

  GoalOption({
    required this.title,
    required this.description,
    required this.iconPath,
    required this.route,
    required this.cardColorType,
  });
}
