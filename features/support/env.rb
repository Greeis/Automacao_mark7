require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'


@browser = ENV['BROWSER']

if @browser.eql?('headless') #se o browser existir faça
  puts 'Executando com Headless'
  Capybara.javascript_driver = :selenium # delisga o capybara server
  Capybara.run_server = false

  #Configurando Selenium para trabalhar se forma remota
  
  args = ['--no-default-browser-check'] #não pergunta se quer transformar em default

  caps = Selenium::WebDriver::Remote::Capabilities.chrome( #executando somente no chrome
    'chromeOptions' => { 'args' => args }
  )

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(
      app,
      browser: :remote,
      url: 'http://selenium:4444/wd/hub',
      desired_capabilities: caps
    )
  end
else
    puts 'Executando sem Headless'
    Capybara.configure do |config| # chamando uma configuração do capybara
    # config.default_driver = :selenium_chrome # definindo que o driver default é o Chrome
    config.default_driver = :selenium # chama o firefox
    config.app_host = 'https://mark7.herokuapp.com' #definindo a url padrão

    Capybara.default_max_wait_time = 5 #espera 5 segundos para procurar elementos na tela
end
  




