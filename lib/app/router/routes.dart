enum Routes {
  root(name: 'root', overwritePath: '/'),
  player(name: 'player', overwritePath: '/play/:station_id');

  const Routes({
    required this.name,
    this.overwritePath,
  });

  final String name;
  final String? overwritePath;

  String get path => overwritePath != null ? overwritePath! : '/$name';
}
