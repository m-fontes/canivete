# encoding: utf-8

Dado(/^que tenho acesso ao Abertura de Conta Digital em "([^"]*)"$/) do |url_conta_pre|
	puts "Verificando acesso a '" + url_conta_pre + "'..."
	options = Selenium::WebDriver::Chrome::Options.new
	options.add_argument('--ignore-certificate-errors')
	options.add_argument('--disable-popup-blocking')
	# "@chrome" indica que a variavel chrome sera enxergada em todos os steps!
	@chrome = Selenium::WebDriver.for :chrome, options: options
	@chrome.navigate.to url_conta_pre
	sleep(6)
end

Quando(/^eu acessar a pagina, clicar "([^"]*)" e inserir o CPF "([^"]*)"$/) do |continuar, cpf_teste|
	@chrome.find_element(:link_text, continuar).click
	sleep(4)
	@chrome.find_elements(:css, 'div').last.location_once_scrolled_into_view
	sleep(1)
	puts "Validando com o seguinte CPF, gerado em 'https://www.geradordecpf.org/': " + cpf_teste
	@chrome.find_element(:css, 'input[type="text"]').send_keys cpf_teste
	sleep(3)
end

Então(/^vou clicar "([^"]*)"$/) do |continuar|
	@chrome.find_element(:link_text, continuar).click
end

Então(/^serei redirecionado ao início do processo de abertura de contas$/) do
	sleep(4)
	# Fechando:
	@chrome.quit
end

