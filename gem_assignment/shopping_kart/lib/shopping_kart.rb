  require "csv"
 


  module List_Search
    def list
       puts "product_id,product_name,product_stock,company_name"
       puts "--------------------------------------------------"
       CSV.foreach('inventory.csv', :headers => true) do |product|
       puts "#{product}"
       end
    end
    def search
       puts "enter the name of the product"
       product_name=gets.chomp
       flag=0
       CSV.foreach('inventory.csv', :headers => true) do |product|
	
         if(product['name']==product_name)
           puts "product_id,product_name,product_stock,company_name"
           puts "--------------------------------------------------"
           puts "#{product}"
           flag=1
         end
       end
       if(flag==0)
         puts "No such product exist"
       end
   end
   def update_product(new_products)
     inventory=File.open("inventory.csv","w")
     header = "id,name,price,stock_item,company_name\n"
     inventory.puts("#{header}")
     new_products.each do |product|
       inventory.puts("#{product}") 
     end
     inventory.close	
   end
  end
    


  class ShopKeeper 
  include List_Search

    def options
       
       while true
       puts "what you want to perform? 1.Add_product 2.remove_product 3.list_product 4.search produts  5.edit products 6.exit."
       shopkeeper_options={1=> :add,2=> :remove,3=> :list,4=> :search,5=>:edit, 6=> :exit}
       selected_menu=gets.chomp.to_i
       send(shopkeeper_options[selected_menu])
       end
      
    end
     
    def exit
      abort("BYE BYE")
    end  

    def add
       inventory=File.new("inventory.csv","a+")
       if File.zero?("inventory.csv")
          header = "id,name,price,stock_item,company_name\n"
          inventory.puts("#{header}")
       end
       puts "enter the product name"
       product_name=gets.chomp
       puts "enter the price"
       price=gets.chomp.to_i
       puts "enter the stock_item"
       stock_item=gets.chomp.to_i
       puts "enter the company name"
       company_name=gets.chomp
       id=rand(1..1000)
       product=Product.new(id,product_name,price,stock_item,company_name)
       inventory.puts("#{product.id},#{product.name},#{product.price},#{product.stock_item},#{product.company_name}")
       inventory.close  
    end
    
    def remove
      new_products=Array.new
      puts "enter the product id you want to remove"
      id=gets.chomp.to_i
      flag=0
       CSV.foreach("inventory.csv", :headers => true) do |product|
         if(product['id'].to_i==id)
           flag=1
           next
          
         else
           new_products << product
         end
       end
       if(flag==0)
         puts "No such product exist"
       else
       update_product(new_products)
       end	 
    end
	
	
    def edit
      new_products=[]
      puts "enter the product id you want to edit"
      id=gets.chomp.to_i
      flag=0
      CSV.foreach("inventory.csv", :headers => true) do |product|
        if(product['id'].to_i==id)
          flag=1
	  puts "enter the product name"
          product['name']=gets.chomp
          puts "enter the price"
          product['price']=gets.chomp.to_i
          puts "enter the stock_item"
          product['stock_item']=gets.chomp.to_i
          puts "enter the company name"
          product['company_name']=gets.chomp
	end
          new_products << product
      end
      if(flag==0)
        puts "No such product exist"
      else
        update_product(new_products)
      end	  
    end
  end
 
  class Customer
  include List_Search
    @@orders=File.new("orders.csv","a+")
    if File.zero?("orders.csv")
      header = "purchased_product_id,customer_name,card_no,cvv\n"
      @@orders.puts("#{header}")
    end
    
   
    def options
	   while true
	     puts "what you want to perform?  1.list_product 2.search produts  3.buy products 4.exit."
             choice=gets.chomp.to_i
	     case choice
		 when 1
		   list
		 when 2
		   search
		 when 3
		   buy_product
		 when 4
		    @@orders.close
                    abort("Thank you,Visit Again")
		 else
		    puts "not a valid input"
	     end
		  
	   end
    end
  
    
    def buy_product
	  new_products=Array.new
	  puts "enter the product id you want to buy"
	  id=gets.chomp.to_i
          flag=0
	  CSV.foreach('inventory.csv',headers:true) do |product|
             if(product['id'].to_i==id)
               flag=1
	       if(product['stock_item'].to_i==0)
	         puts "sorry the product is not available"
	       else
	         customer_array=Array.new
		 customer_array[0]=id
		 puts "please enter your name"
		 customer_array[1]=gets.chomp
		 puts "please enter the credit card number"
		 customer_array[2]=gets.chomp
		 puts "please enter the cvv"
		 customer_array[3]=gets.chomp.to_i
		 @@orders.puts("#{customer_array[0]},#{customer_array[1]},#{customer_array[2]},#{customer_array[3]}")
		 product['stock_item']=product['stock_item'].to_i-1
	       end
             end
	 new_products << product
         end
         if(flag==0)
           puts "No such product exist"
         end
	 update_product(new_products)
    end
  end
  
    


  class Product
    def initialize(id, name, price, stock_item, company_name)
      @id=id
      @name=name
      @price=price
      @stock_item=stock_item
      @company_name=company_name 
    end
    attr_reader :id, :name, :price, :stock_item, :company_name
  end

  puts "May I Who Are U? 1.shopkeeper 2.Customer"
  choice=gets.chomp.to_i
  case choice
    when 2
      customer_obj=Customer.new
      customer_obj.options
   when 1
      shopkeeperObj=ShopKeeper.new
      shopkeeperObj.options
   else
      puts "not a valid choice"
  end      
