import 'package:flutter_design_patterns/Display/design_pattern.dart';


class Adapter extends DesignPattern {
  Adapter([ipa,sourceFilePath,topics]) : super(ipa,sourceFilePath,topics);


  @override
  String testRun() {
    var inventory =  ShopInventory();

//adding regular store products - ones that implement Product interface
    inventory.addProduct( CosmeticProduct("32423432432","Lavie Handbag", 5000.0));
    inventory.addProduct( SportProduct("32423423444","Yoga SmartFit", 2000.75));


//adding GroceryItem to the store using an adapter
    GroceryItemAdaptee groceryItem =  GroceryItemAdaptee("Wheat Flour", 100);
    inventory.addProduct( GroceryItem(groceryItem));

    return """
    //the ShopInventory , these are its own prducts 
    ${inventory.iproducts![0].toString()}
    ${inventory.iproducts![1].toString()}
    
   //we added the external product into the ShopInventory database
    ${inventory.iproducts![2].toString()}
    """;
  }
}


//adapter
abstract class IProductAdapter {
String getName();
double getPrice();
}


class ShopInventory {

  List<IProductAdapter>? iproducts;

  ShopInventory([products]) : this.iproducts =    ( products != null ? products :  [] ) ;

  void addProduct(IProductAdapter iProduct) {
    this.iproducts!.add(iProduct);
  }

  void removeProduct(IProductAdapter iProduct) {
    this.iproducts!.remove(iProduct);
  }
}

//Adaptee : The third-party store
 class GroceryItemAdaptee {
  final String itemName;
  final double costPerUnit;

  GroceryItemAdaptee(this.itemName, this.costPerUnit);

  @override
  String toString() {
    return 'GroceryItem{itemName: $itemName, costPerUnit: $costPerUnit}';
  }
}

//concreteAdapter
 class GroceryItem implements IProductAdapter {

   GroceryItemAdaptee _groceryItem;

   GroceryItem(this._groceryItem) ;

  @override
  String getName() {
    return _groceryItem.itemName;
  }

  @override
  double getPrice() {
    return _groceryItem.costPerUnit;
  }

}


abstract class Product implements IProductAdapter{
  final String id;
  final String name;
  final double price;

  Product(this.id,this.name, this.price);

  @override
  String toString() {
    return 'Product{id: $id, name: $name, price: $price}';
  }
}

class CosmeticProduct extends Product{
  CosmeticProduct(id,name,price):super(id,name,price);

  @override
  String getName() =>super.name;

  @override
  double getPrice() =>super.price;
}

class SportProduct extends Product{
  SportProduct(id,name,price):super(id,name,price);

  @override
  String getName() =>super.name;

  @override
  double getPrice() =>super.price;
}