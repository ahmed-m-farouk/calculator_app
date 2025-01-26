abstract class CalculatorState {
  final String display;

  const CalculatorState(this.display);
}

class CalculatorInitial extends CalculatorState {
  const CalculatorInitial() : super("");
}

class CalculatorUpdated extends CalculatorState {
  const CalculatorUpdated(super.display);
}
