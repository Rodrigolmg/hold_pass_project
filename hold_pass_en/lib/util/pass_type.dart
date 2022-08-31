enum PassType {
  email(1),
  website(2),
  app(3),
  game(4),
  other(5);

  const PassType(this.valueNum);
  final num valueNum;
}