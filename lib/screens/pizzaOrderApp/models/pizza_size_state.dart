enum PizzaSizeValues {
  small,
  medium,
  large,
}

class PizzaSizeState {
  final PizzaSizeValues value;
  final double factor;

  PizzaSizeState({required this.value}) : factor = _getSizeFactorByValue(value);

  static double _getSizeFactorByValue(PizzaSizeValues value) {
    switch (value) {
      case PizzaSizeValues.small:
        return 0.75;
      case PizzaSizeValues.medium:
        return 0.85;
      case PizzaSizeValues.large:
        return 1.0;
      default:
        return 0.0;
    }
  }
}
