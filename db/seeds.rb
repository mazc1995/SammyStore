item1 = Item.create(
  name: 'Gafas de sol Carey',
  item_type: 'Producto',
  stock: 100,
  price: 39.99,
  thumbnail: 'url_a_la_imagen',
  description: 'Gafas de sol con marco de carey.'
)

item2 = Item.create(
  name: 'Red Hot Chili Peppers en Madrid',
  item_type: 'Evento',
  stock: 50,
  price: 60.00,
  thumbnail: 'url_a_la_imagen',
  description: 'Concierto de Red Hot Chili Peppers en Madrid.'
)

cart = Cart.create(total: 0)

CartItem.create(cart: cart, item: item1, quantity: 3, subtotal: item1.price * 3)
CartItem.create(cart: cart, item: item2, quantity: 5, subtotal: item2.price * 5)
