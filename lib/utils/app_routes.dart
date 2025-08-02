class RouteInfo {
  String name;
  String path;

  RouteInfo(this.name, this.path);
}

class AllRoutes {
  static RouteInfo login = RouteInfo('Login', '/app/login');
  static RouteInfo resetPassword = RouteInfo(
    'Reset Password',
    'reset-password',
  );
  static RouteInfo home = RouteInfo('Home', '/app/home');
  static RouteInfo analysis = RouteInfo('Analysis', '/app/analysis');
  static RouteInfo profile = RouteInfo('Profile', '/app/profile');
  static RouteInfo updateStatus = RouteInfo('Update Status', 'update-status');
}
