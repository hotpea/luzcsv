# get itens for order
def getItemsFromOrder orderItems, idOrder, products
  totalCountItems = 0
  totalValueOrder = 0

  orderItems.each do |orderItem|
    idOrderInItem, idItem = orderItem.split ','

    if idOrderInItem.to_i == idOrder.to_i
      products.each do |product|
        idProduct, valueProduct = product.split ','
        if idItem.to_i == idProduct.to_i
          totalCountItems = totalCountItems + 1
          totalValueOrder = totalValueOrder.to_f + valueProduct.to_f
        end
      end
    end
  end

  return totalCountItems, totalValueOrder
end