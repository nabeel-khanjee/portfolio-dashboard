class DashboardButtons {
  final String buttons;
  final String type;

  DashboardButtons(this.buttons, this.type);
}

final List<DashboardButtons> buttons = [
  DashboardButtons("Add Experience",'addExp'),
  DashboardButtons("Set Experience",'setExp'),
  DashboardButtons("Add Skills",'addSk'),
  DashboardButtons("Set Skills",'setSk'),
  DashboardButtons("Add Projects",'addPro'),
  DashboardButtons("Set Projects",'setPro'),
  DashboardButtons("Add Detail",'addDt'),
  DashboardButtons("Set Detail",'setDt'),
  DashboardButtons("Add Knowleadge",'addKn'),
  DashboardButtons("Set Knowleadge",'setKn'),
];
