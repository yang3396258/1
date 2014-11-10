# coding: utf-8

numbers = ["2233-444-111", "3334-442-421", "6567-234-545"]
names = ["猫が嫌い", "犬が好き", "パンダが大好き"]
full_names = ["太郎", "次郎", "花子"]
publisher_names=["心身社", "広告社", "委員社"]
prices=["2000","1000","1400"]
places=["研究室A本棚","研究室B本棚","研究室C本棚"]
0.upto(2) do |idx|
  book= Book.create(
  { number: numbers[idx],
    name: names[idx],
    full_name: full_names[idx],
    publisher_name: publisher_names[idx],
    price: prices[idx],
    place: places[idx]
    
  }, without_protection: true)
  
 
end
