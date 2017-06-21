# encoding: utf-8

Quando(/^eu abrir o Chrome e digitar "([^"]*)"$/) do |arg1|
	puts "Verificando a URL: " + arg1
	#URL = "http://www.google.com"
	options = Selenium::WebDriver::Chrome::Options.new
	options.add_argument('--ignore-certificate-errors')
	options.add_argument('--disable-popup-blocking')
	options.add_argument('--disable-translate')
	driver = Selenium::WebDriver.for :chrome, options: options
	driver.navigate.to arg1
	#puts driver.title
	
	element = driver.find_element(:name, 'q')
	element.send_keys "Ruby BDD"
	sleep(2)
	element.submit
	sleep(2)
	#sleep(2)
	#element = driver.find_element(:name, 'password')
	#element.send_keys "Blablabla"
	#driver.find_element(:id, 'passwordNext').click
	#sleep(13)
	driver.quit
end
