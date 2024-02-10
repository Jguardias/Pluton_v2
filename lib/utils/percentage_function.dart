double percentageFunction(double value, double percentage) {
  double percentRatio = percentage / 100;

  double calculatedPercentage = (value * percentRatio);

  // String formattedNumber = calculatedPercentage.toStringAsFixed(2);

  return calculatedPercentage;
}

List<String> filledStorage(double value) {
  
  List<double> percentage = [21.0,6.0,2.7,1.0];
  List<double> storagePercentage = [];
  List<double> storageValue = [];
  storageValue.add(value);
    
  for (int i = 0; i < percentage.length; i++) {
    double a = storageValue[i];
    double b = percentageFunction(a, percentage[i]);
    double c = storageValue[i] - b;
    storageValue.add(c);
    storagePercentage.add(b);
  }

  double total = storagePercentage.reduce((a, b) => a + b);
  storagePercentage.add(total);
  storagePercentage.add(storageValue[4]);
  List<String> checkList = storagePercentage.map((valor) => valor.toStringAsFixed(1)).toList();
  
  return checkList;
}
