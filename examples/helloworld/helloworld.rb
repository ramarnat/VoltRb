require 'rubygems'
require 'voltrb'

# Connect to the Volt DB instance running on the same machine.
client = VoltRb::Client.new

# Insert "Hello, World" for different languages.
client.call_procedure(:Insert, "Hello", "World", "English")
client.call_procedure(:Insert, "Bonjour", "Monde", "French")
client.call_procedure(:Insert, "Hola", "Mundo", "Spanish")
client.call_procedure(:Insert, "Hej", "Verden", "Danish")
client.call_procedure(:Insert, "Ciao", "Mondo", "Italian")

# Say it in Spanish!
response = client.call_procedure(:Select, "Spanish")
puts "#{response.results[0].first[:HELLO]}, #{response.results[0].first[:WORLD]}!"

