#language:pt

Funcionalidade: Login
    Para que eu possa cadastrar e gerenciar minhas tarefas
    Sendo um usuário
    Posso acessar o sistema com meu email e senha previamente cadastrado

Contexto: Home
    Dado que eu acesso o sistema

@sprint1 @logout
Cenario: Usuário autenticado

    Quando faço login com 'graaziele@gmail.com' e '123456'
    Então vejo a seguinte mensagem de boas vindas 'Olá, Graziele'

@sprint1 
Cenario: Senha incorreta

    Quando faço login com 'graaziele@gmail.com' e 'xpto123'
    Então vejo a seguinte mensagem de alerta 'Senha inválida.'

@sprint1
Cenario: Usuário não cadastrado

    Quando faço login com 'lalala@gmail.com' e '123456'
    Então vejo a seguinte mensagem de alerta 'Usuário não cadastrado.'

@sprint1
Cenario: Email obrigatório

    Quando faço login com '' e '123456'
    Então vejo a seguinte mensagem de alerta 'Email incorreto ou ausente.'


@sprint1
Cenario: Senha deve ser obrigatório

    Quando faço login com 'graaziele@gmail.com' e ''
    Então vejo a seguinte mensagem de alerta 'Senha ausente.'


@tentativa @sprint1
Esquema do Cenario: Autenticação

    Quando faço login com '<email>' e '<senha>'
    Então vejo a seguinte mensagem de alerta '<saida>'
    
    Exemplos:
      | email               | senha   | saida                       |
      | graaziele@gmail.com | xpto123 | Senha inválida.             |
      | eulala@papito.io    | 123456  | Usuário não cadastrado.     |
      |                     | 123456  | Email incorreto ou ausente. |
      | graaziele@gmail.com |         | Senha ausente.              |
 