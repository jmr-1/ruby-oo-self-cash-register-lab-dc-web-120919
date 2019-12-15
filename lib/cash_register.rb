require "pry"
class CashRegister

    attr_accessor :discount, :total, :items, :last_transaction 

    def initialize(discount = 0 )

        @total = 0 
        @discount = discount 
        @items = []
    end 

    def add_item(title, price, quantity=1)

        #writes the item name in the list of items quantity times 
        quantity.times do 
            self.items << title #bug: stack too deep?
            #bug solved: def items referencing @items when accessor exists
        end 

        #default 1 item, optional, can just add title/price to total
        self.total += price*quantity
        self.last_transaction = [title, price, quantity]
    end 

    def apply_discount
        
        if self.discount != 0
            discount = self.total*self.discount*0.01 #given discount is in %
            self.total -= discount 
            return "After the discount, the total comes to $#{self.total.to_i}."
        else
            return "There is no discount to apply."
        end 
    end 

    def void_last_transaction

        self.items.pop(1) #removes last item from self.items list 
        last_item = self.last_transaction 
        last_add = last_item[1]*last_item[2]
        return self.total -= last_add #removes price from total
    end 

end 