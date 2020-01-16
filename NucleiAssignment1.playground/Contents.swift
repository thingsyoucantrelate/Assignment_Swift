import UIKit

protocol Item
{
    var name:String {get set}
    var price:Double {get set}
    var quantity:Int {get set}
    var type:String {get}
    var final_price:Double!{get set}
    
    func calc_tax() -> Double
}


class rawItem:Item
{
    var name:String
    var price:Double
    var quantity:Int
    var type:String
    var final_price:Double!
    
    init(name:String, price:Double, quantity:Int, type:String)
    {
        self.name = name
        self.price = price
        self.quantity = quantity
        self.type = type
    }
    
    func calc_tax() -> Double {
        var tax:Double = 0
        tax = Double(price) * (0.125)
        final_price = (tax + Double(price)) * Double(quantity)
        return tax
    }
}

class manufacturedItem:Item
{
    var name:String
    var price:Double
    var quantity:Int
    var type:String
    var final_price:Double!
    
    init(name:String, price:Double, quantity:Int, type:String)
    {
        self.name = name
        self.price = price
        self.quantity = quantity
        self.type = type
    }
    
    func calc_tax() -> Double {
        var tax:Double = 0
        tax = 0.125 * Double(price)
        tax = 0.02 * (tax + Double(price))
        final_price = (tax + Double(price)) * Double(quantity)
        return tax
    }
}

class importedItem:Item
{
    var name:String
    var price:Double
    var quantity:Int
    var type:String
    var final_price:Double!
    
    init(name:String, price:Double, quantity:Int, type:String)
    {
        self.name = name
        self.price = price
        self.quantity = quantity
        self.type = type
    }
    
    func calc_tax() -> Double {
        var tax:Double = 0
        tax = 0.1 * Double(price)
        if tax + Double(price) <= 100
        {
            tax += 5
        }
        else if (tax + Double(price) > 100) && (tax + Double(price) <= 200)
        {
            tax += 10
        }
        else if tax + Double(price) > 200
        {
            tax += tax * 0.05
        }
        else
        {
            print("Your'e not supposed to be here")
        }
        
        final_price = (tax + Double(price)) * Double(quantity)
        return tax
    }
}


//main function starts here

//print("Enter the details of the item below")

var flag:Bool = true

while flag
{
    var choice:Int = 0
    var input_choice:Bool = true
    var name:String?
    var type:String?
    var price:Double?
    var quantity:Int?
    
    var item_array:[Item] = []
    let type_checklist = ["raw","manufactured","imported"]
    //TODO: array cleanup
    
    let display_string = """

    1.Enter the details of an item
    2.Display all the items
    3.Exit

    """
    
    print("Choose an option")
    print(display_string)
    
    //var choice:Int?
    
    while input_choice
    {
        let choice_string = readLine(strippingNewline: true)
        if let choice_str = choice_string
        {
            if let choice_int = Int(choice_str)
            {
                choice = choice_int
                input_choice = false
            }
            else
            {
                print("Enter a valid value for choice")
            }
        }
        else
        {
            print("Enter a valid value for choice")
        }
    }
    
    
    switch choice
    {
    case 1:
        print("Enter the name of the item")
        var name_validator:Bool = true
        
        while name_validator
        {
            name = readLine(strippingNewline: true)
            if name == nil
            {
                print("Enter a valid string for name")
            }
            else
            {
                name_validator = false
            }
        }
        
        print("Enter the type of the item (i.e raw/manufactured/imported)")
        var type_validator:Bool = true
        
        while type_validator
        {
            type = readLine(strippingNewline: true)
            
            if type != nil
            {
                if(!type_checklist.contains(type!))
                {
                    print("Enter a valid type of item")
                }
                else
                {
                    type_validator = false
                }
            }
            else
            {
                print("Enter a valid string for type")
            }
        }
        
        print("Enter the price of the item(Double)")
        
        var price_validator = true
        
        while price_validator
        {
            let price_string:String? = readLine(strippingNewline: true)
            
            if price_string != nil
            {
                price = Double(price_string!)
                if price != nil
                {
                    if price! < 0.00
                    {
                        print("Provided a negative value for price")
                        print("Enter a positive value")
                    }
                    else
                    {
                        price_validator = false
                    }
                }
                else
                {
                    print("Enter a proper number for price")
                }
            }
        }
        
        print("Enter the quantity of the items(Int)")
        
        var quantity_validator:Bool = true
        
        while quantity_validator
        {
            let quant_str:String? = readLine(strippingNewline: true)
            
            if quant_str != nil
            {
                quantity = Int(quant_str!)
                if quantity != nil
                {
                    if quantity! < 0
                    {
                        quantity = 0
                    }
                    quantity_validator = false
                }
                else
                {
                    print("Enter a valid integer for quantity")
                }
            }
            else
            {
                print("Enter a valid string for quantity")
            }
        }
        /*
        var perm_name:String = name!
        var perm_type:String = type!
        var perm_price:Double = price!
        var perm_quantity:Int = quantity!
        */
        switch type!
        {
        case "raw":
            let raw_item = rawItem(name: name!, price: price!, quantity: quantity!, type: type!)
            let tax:Double = raw_item.calc_tax()
            print("The tax of the item is \(tax)")
            item_array.append(raw_item)
        case "manufactured":
            let manufactured_item = manufacturedItem(name: name!, price: price!, quantity: quantity!, type: type!)
            let tax:Double = manufactured_item.calc_tax()
            print("The tax of the item is \(tax)")
            item_array.append(manufactured_item)
        case "imported":
            let imported_item = importedItem(name: name!, price: price!, quantity: quantity!, type: type!)
            let tax:Double = imported_item.calc_tax()
            print("The tax of the item is \(tax)")
            item_array.append(imported_item)
        default:
            print("Your'e not supposed to be here")
        }
        
        
    case 2:
        print("Printing items...")
        print("Name\t\tPrice\t\tType\t\tQuantity\t\tFinal Price")
        for temp_item in item_array
        {
            print("\(temp_item.name)\t\t\(temp_item.price)\t\t\(temp_item.type)\t\t\(temp_item.quantity)\t\t\(temp_item.final_price)")
        }
    case 3:
        print("Exititng...")
        flag = false
        item_array.removeAll()
    default:
        print("Enter a proper value for choice (1/2/3)")
    }
}
