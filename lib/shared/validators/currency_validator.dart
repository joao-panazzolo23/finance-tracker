class CurrencyValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe um válor válido.';
    }
    final number = double.tryParse(value);
    if (number == null) {
      return "Valor inválido.";
    }
    if (number <= 0) {
      return "O valor não pode ser negativo.";
    }
    return null;
  }
}
