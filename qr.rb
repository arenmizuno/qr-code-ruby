# Write your solution here!
require "rqrcode"

# Use the RQRCode::QRCode class to encode some text
qrcode = RQRCode::QRCode.new("wikipedia qr code")

# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
IO.binwrite("sometext.png", png.to_s)

pp "What kind of QR code would you like to generate?"
pp
pp "1. Open a URL"
pp "2. Join a wifi network"
pp "3. Send a text message"
pp

option = gets.chomp
pp

if option.include?("1")
  pp "What is the URL you would like to encode?"
  pp
  
  text_to_encode = gets.chomp
  pp

elsif option.include?("2")
  pp "What is the name of the wifi network?"
  pp

  network_name = gets.chomp
  pp

  pp "What is the password?"
  pp

  network_password = gets.chomp
  pp

  text_to_encode = "WIFI:T:WPA;S:#{network_name};P:#{network_password};;"
  
elsif option.include?("3")
  pp "What is the phone number you want the code to send a text message to?"
  pp

  phone_number = gets.chomp
  pp

  pp "What is the message?"
  pp

  message = gets.chomp
  pp

  text_to_encode = "SMSTO:#{phone_number}:#{message}"
else
  pp "Didn't recognize that selection. Please try again."
  pp
end

pp "What would you like to call the PNG?"
pp

filename = gets.chomp
pp

qrcode = RQRCode::QRCode.new(text_to_encode)

png = qrcode.as_png({ :size => 500 })

IO.binwrite("#{filename}.png", png.to_s)
