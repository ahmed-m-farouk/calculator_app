import 'package:bloc/bloc.dart';

import 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  String _firstOperand = "";
  String _secondOperand = "";
  String? _operation;

  CalculatorCubit() : super(CalculatorInitial());

  void inputNumber(String number) {
    if (_operation == null) {
      _firstOperand += number;
      emit(CalculatorUpdated(_firstOperand));
    } else {
      _secondOperand += number;
      emit(CalculatorUpdated(_firstOperand + _operation! + _secondOperand));
    }
  }

  void performOperation(String operation) {
    if (_firstOperand.isNotEmpty && _secondOperand.isEmpty) {
      _operation = operation;
      emit(CalculatorUpdated(_firstOperand + operation));
    }
  }

  void calculateResult() {
    if (_firstOperand.isNotEmpty &&
        _secondOperand.isNotEmpty &&
        _operation != null) {
      double num1 = double.tryParse(_firstOperand) ?? 0;
      double num2 = double.tryParse(_secondOperand) ?? 0;
      double result;

      switch (_operation) {
        case "+":
          result = num1 + num2;
          break;
        case "-":
          result = num1 - num2;
          break;
        case "*":
          result = num1 * num2;
          break;
        case "/":
          result = num2 != 0 ? num1 / num2 : 0; // Avoid division by zero
          break;
        default:
          result = 0;
      }

      _firstOperand = result.toString();
      _secondOperand = "";
      _operation = null;
      emit(CalculatorUpdated(_firstOperand));
    }
  }

  void clear() {
    _firstOperand = "";
    _secondOperand = "";
    _operation = null;
    emit(CalculatorUpdated(""));
  }
}
