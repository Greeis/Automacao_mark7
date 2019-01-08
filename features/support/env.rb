require 'capybara'
require 'capybara/cucumber'

Capybara.configure do |config| # chamando uma configuração do capybara
    # config.default_driver = :selenium_chrome # definindo que o driver default é o Chrome
    config.default_driver = :selenium # chama o firefox
    config.app_host = 'https://mark7.herokuapp.com' #definindo a url padrão
end

Capybara.default_max_wait_time = 5 #espera 5 segundos para procurar elementos na tela