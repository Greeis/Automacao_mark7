# REGEX ou Expressão Regular
# Contem => *
# termina com => $
# começa com => ^

Before do # criar um before generico para instanciar uma classe
    @nav = Navbar.new
    @side = Sidebar.new
    @login_page = LoginPage.new
    @tarefas_page = TarefasPage.new
    @perfil_page = PerfilPage.new
    @cadastro_page = CadastroPage.new 

    page.current_window.resize_to(1440, 900)
end

Before ('@login') do

    @usuario = { email: 'graaziele@gmail.com', senha: '123456'}

    @login_page.acessar
    @login_page.logar(@usuario[:email], @usuario[:senha])
end

After('@logout') do # toda vez que tiver um cenario que tiver essa tag, ele sera chamado
   @nav.sair
end

After do |scenario|  
    nome = scenario.name.gsub(/[^A-Za-z0-9 ]/, '') # essa expressao regular subtitui por nada... retira todos os caracteres especiais
    nome = nome.tr(' ', '_').downcase! #deixa tudo em caixa abaixa
    shot = "log/screenshots/#{nome}.png"

    page.save_screenshot(shot)
    embed(shot, 'image/png', 'Tá aqui o print')
end