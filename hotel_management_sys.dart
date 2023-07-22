import 'dart:io';

// Initialize the user's order lists and previous orders
List<String> orderItems = [];
List<double> orderPrices = [];
List<List<double>> previousOrderPrices = [];

// Define a function to display the available food items
void displayFoodItems(List<String> foodItems, List<double> prices) {
  print("Available Food Items:");
  for (var i = 0; i < foodItems.length; i++) {
    print("${i + 1}. ${foodItems[i]} - \$${prices[i]}");
  }
}

// Function to take user input for adding an item to the order
void addToOrder(List<String> foodItems, List<double> prices,
    List<String> orderItems, List<double> orderPrices) {
  displayFoodItems(foodItems, prices);
  stdout.write("Enter the number of the food item to add: ");
  int itemNumber = int.parse(stdin.readLineSync()!);
  if (itemNumber >= 1 && itemNumber <= foodItems.length) {
    orderItems.add(foodItems[itemNumber - 1]);
    orderPrices.add(prices[itemNumber - 1]);
    print("${foodItems[itemNumber - 1]} added to your order.");
  } else {
    print("Invalid item number.");
  }
}

// Function to remove an item from the order
void removeFromOrder(List<String> orderItems, List<double> orderPrices) {
  if (orderItems.isEmpty) {
    print("Your order is empty.");
    return;
  }
  displayOrder(orderItems, orderPrices);
  stdout.write("Enter the number of the food item to remove: ");
  int itemNumber = int.parse(stdin.readLineSync()!);
  if (itemNumber >= 1 && itemNumber <= orderItems.length) {
    print("${orderItems[itemNumber - 1]} is removed from your order.");
    orderItems.removeAt(itemNumber - 1);
    orderPrices.removeAt(itemNumber - 1);
  } else {
    print("Invalid item number.");
  }
}

// Function to display the current order
void displayOrder(List<String> orderItems, List<double> orderPrices) {
  if (orderItems.isEmpty) {
    print("-----------------");
    print("Your order is empty.");
    return;
  }
  print("-----------------------");
  print("Your Order:");
  for (var i = 0; i < orderItems.length; i++) {
    print("${i + 1}. ${orderItems[i]} - \$${orderPrices[i]}");
  }
}

// Function to calculate the total amount of the order
double calculateTotalAmount(List<double> orderPrices) {
  double total = 0;
  for (var i = 0; i < orderPrices.length; i++) {
    total += orderPrices[i];
  }
  return total;
}

// Function to edit the current order
void editOrder(List<String> foodItems, List<double> prices,
    List<String> orderItems, List<double> orderPrices) {
  if (orderItems.isEmpty) {
    print("--------------------------");
    print("Your order is empty.");
    return;
  }
  print("Current Order:");
  displayOrder(orderItems, orderPrices);
  stdout.write("Enter the number of the food item to edit: ");
  int itemNumber = int.parse(stdin.readLineSync()!);
  if (itemNumber >= 1 && itemNumber <= orderItems.length) {
    print("---------------------------");
    print("${orderItems[itemNumber - 1]} is removed from your order.");
    orderItems.removeAt(itemNumber - 1);
    orderPrices.removeAt(itemNumber - 1);
    addToOrder(foodItems, prices, orderItems, orderPrices);
  } else {
    print("Invalid item number.");
  }
}

void main() {
  // Initialize the lists of food items and their prices
  List<String> foodItems = [
    "Burger",
    "Pizza",
    "Pasta",
    "Salad",
    "Ice Cream",
    "Sandwich",
    "Soda",
    "Steak"
  ];
  List<double> prices = [8.99, 10.99, 7.99, 5.99, 4.99, 6.99, 1.99, 15.99];

  while (true) {
    print("\n------------ Hotel Management System --------------");
    print("1. Display Available Food Items");
    print("2. Add Food Item to Order");
    print("3. Remove Food Item from Order");
    print("4. View Current Order");
    print("5. Edit Current Order");
    print("6. Calculate Total Amount");
    print("0. Exit");
    stdout.write("Enter your choice: ");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        displayFoodItems(foodItems, prices);
        break;
      case 2:
        addToOrder(foodItems, prices, orderItems, orderPrices);
        break;
      case 3:
        removeFromOrder(orderItems, orderPrices);
        break;
      case 4:
        displayOrder(orderItems, orderPrices);
        break;
      case 5:
        editOrder(foodItems, prices, orderItems, orderPrices);
        break;
      case 6:
        double totalAmount = calculateTotalAmount(orderPrices);
        print("Total Amount: \$${totalAmount.toStringAsFixed(2)}");
        break;
      case 0:
        print(
            "===============Thank you for using the Hotel Management System. Have a great day!==============");
        return;
      default:
        print("Invalid choice. Please try again.");
        break;
    }
  }
}
//https://github.com/Abdul-Haseeb-Rajput/console_based_project