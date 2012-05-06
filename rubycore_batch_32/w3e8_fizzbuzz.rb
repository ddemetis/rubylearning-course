
def fizzbuzz
	numbers = *(1..100)
	numbers = numbers.collect do |number|
    number_fizzbuzz = ''
    number_fizzbuzz += 'Fizz' if number % 3 == 0
    number_fizzbuzz += 'Buzz' if number % 5 == 0
    number_fizzbuzz.size > 1 ? number_fizzbuzz : number
	end
  numbers.join("\n") + "\n"
end



#test if result is same as in string given in forum
a = "1\n2\nFizz\n4\nBuzz\nFizz\n7\n8\nFizz\nBuzz
11\nFizz\n13\n14\nFizzBuzz\n16\n17\nFizz\n19\nBuzz\nFizz
22\n23\nFizz\nBuzz\n26\nFizz\n28\n29\nFizzBuzz\n31\n32
Fizz\n34\nBuzz\nFizz\n37\n38\nFizz\nBuzz\n41\nFizz\n43
44\nFizzBuzz\n46\n47\nFizz\n49\nBuzz\nFizz\n52\n53\nFizz
Buzz\n56\nFizz\n58\n59\nFizzBuzz\n61\n62\nFizz\n64\nBuzz
Fizz\n67\n68\nFizz\nBuzz\n71\nFizz\n73\n74\nFizzBuzz\n76
77\nFizz\n79\nBuzz\nFizz\n82\n83\nFizz\nBuzz\n86\nFizz\n88
89\nFizzBuzz\n91\n92\nFizz\n94\nBuzz\nFizz\n97\n98\nFizz\nBuzz\n"



b = fizzbuzz
puts b
puts "Is same result? #{a == b}"

